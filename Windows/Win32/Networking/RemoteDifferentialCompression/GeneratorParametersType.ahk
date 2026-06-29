#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of supported generator parameters.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ne-msrdc-generatorparameterstype
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct GeneratorParametersType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The generator parameters type is unknown.
     * @type {Integer (Int32)}
     */
    static RDCGENTYPE_Unused => 0

    /**
     * The FilterMax generator was used to generate the parameters.
     * @type {Integer (Int32)}
     */
    static RDCGENTYPE_FilterMax => 1
}
