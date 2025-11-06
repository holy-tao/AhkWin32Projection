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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-getgeneratorparameterstype
     */
    GetGeneratorParametersType() {
        result := ComCall(3, this, "int*", &parametersType := 0, "HRESULT")
        return parametersType
    }

    /**
     * 
     * @param {Pointer<Integer>} currentVersion 
     * @param {Pointer<Integer>} minimumCompatibleAppVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-getparametersversion
     */
    GetParametersVersion(currentVersion, minimumCompatibleAppVersion) {
        currentVersionMarshal := currentVersion is VarRef ? "uint*" : "ptr"
        minimumCompatibleAppVersionMarshal := minimumCompatibleAppVersion is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, currentVersionMarshal, currentVersion, minimumCompatibleAppVersionMarshal, minimumCompatibleAppVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-getserializesize
     */
    GetSerializeSize() {
        result := ComCall(5, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * 
     * @param {Integer} size 
     * @param {Pointer<Integer>} parametersBlob 
     * @param {Pointer<Integer>} bytesWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-serialize
     */
    Serialize(size, parametersBlob, bytesWritten) {
        parametersBlobMarshal := parametersBlob is VarRef ? "char*" : "ptr"
        bytesWrittenMarshal := bytesWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", size, parametersBlobMarshal, parametersBlob, bytesWrittenMarshal, bytesWritten, "HRESULT")
        return result
    }
}
