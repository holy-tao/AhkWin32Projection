#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is the generic interface for all types of generator parameters. All generator parameter objects must support this interface.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdcgeneratorparameters
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcGeneratorParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRdcGeneratorParameters
     * @type {Guid}
     */
    static IID => Guid("{96236a71-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcGeneratorParameters
     * @type {Guid}
     */
    static CLSID => Guid("{96236a86-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGeneratorParametersType", "GetParametersVersion", "GetSerializeSize", "Serialize"]

    /**
     * Returns the specific type of the parameters.
     * @returns {Integer} The address of a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-generatorparameterstype">GeneratorParametersType</a> that will receive the type of the parameters.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcgeneratorparameters-getgeneratorparameterstype
     */
    GetGeneratorParametersType() {
        result := ComCall(3, this, "int*", &parametersType := 0, "HRESULT")
        return parametersType
    }

    /**
     * Returns information about the version of RDC used to serialize the parameters.
     * @param {Pointer<Integer>} currentVersion Address of a <b>ULONG</b> that will receive the version of RDC used to serialize the 
     *       parameters for this object. This corresponds to the <b>MSRDC_VERSION</b> constant.
     * @param {Pointer<Integer>} minimumCompatibleAppVersion Address of a <b>ULONG</b> that will receive the version of RDC that is compatible 
     *       with the serialized parameters. This corresponds to the 
     *       <b>MSRDC_MINIMUM_COMPATIBLE_APP_VERSION</b> constant.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcgeneratorparameters-getparametersversion
     */
    GetParametersVersion(currentVersion, minimumCompatibleAppVersion) {
        currentVersionMarshal := currentVersion is VarRef ? "uint*" : "ptr"
        minimumCompatibleAppVersionMarshal := minimumCompatibleAppVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, currentVersionMarshal, currentVersion, minimumCompatibleAppVersionMarshal, minimumCompatibleAppVersion, "HRESULT")
        return result
    }

    /**
     * Returns the size, in bytes, of the serialized parameter data.
     * @returns {Integer} Address of a <b>ULONG</b> that on successful completion is filled with the size, in 
     *       bytes, of the serialized parameter data.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcgeneratorparameters-getserializesize
     */
    GetSerializeSize() {
        result := ComCall(5, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * Serializes the parameter data into a block of memory.
     * @param {Integer} size The size of the buffer pointed to by the <i>parametersBlob</i> parameter.
     * @param {Pointer<Integer>} parametersBlob The address of a buffer to receive the serialized parameter data.
     * @param {Pointer<Integer>} bytesWritten Address of a <b>ULONG</b> that on successful completion is filled with the size, in 
     *       bytes, of the serialized parameter data written to the buffer pointed to by the 
     *       <i>parametersBlob</i> parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcgeneratorparameters-serialize
     */
    Serialize(size, parametersBlob, bytesWritten) {
        parametersBlobMarshal := parametersBlob is VarRef ? "char*" : "ptr"
        bytesWrittenMarshal := bytesWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", size, parametersBlobMarshal, parametersBlob, bytesWrittenMarshal, bytesWritten, "HRESULT")
        return result
    }
}
