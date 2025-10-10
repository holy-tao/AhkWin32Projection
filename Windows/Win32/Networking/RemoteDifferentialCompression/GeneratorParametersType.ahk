#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of supported generator parameters.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/ne-msrdc-generatorparameterstype
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class GeneratorParametersType{

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
