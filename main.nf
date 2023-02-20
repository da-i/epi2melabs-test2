params.input_read_dir             = ""
params.backbone                   = "BB42"
params.reference                  = "T2T.fasta"


process Dummy{
    publishDir "MyOutput", pattern: "", mode: 'copy'

    input:
        path some_file
        path another_file

    output:
        path "directory_contents.txt"

    script:
    """
    ls > directory_contents.txt
    """

}

workflow {
    println ("just a test")
    read_dir_ch = Channel.fromPath( params.input_read_dir, type: 'dir', checkIfExists: true)
    reference_genome = Channel.fromPath(params.reference, checkIfExists: true)

    Dummy(read_dir_ch, reference_genome)
}