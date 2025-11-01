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
     * @param {Pointer<Integer>} parametersType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-getgeneratorparameterstype
     */
    GetGeneratorParametersType(parametersType) {
        result := ComCall(3, this, "int*", parametersType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} currentVersion 
     * @param {Pointer<Integer>} minimumCompatibleAppVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-getparametersversion
     */
    GetParametersVersion(currentVersion, minimumCompatibleAppVersion) {
        result := ComCall(4, this, "uint*", currentVersion, "uint*", minimumCompatibleAppVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgeneratorparameters-getserializesize
     */
    GetSerializeSize(size) {
        result := ComCall(5, this, "uint*", size, "HRESULT")
        return result
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
        result := ComCall(6, this, "uint", size, "char*", parametersBlob, "uint*", bytesWritten, "HRESULT")
        return result
    }
}
