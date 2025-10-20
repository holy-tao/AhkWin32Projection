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
     * 
     * @param {Pointer<Int32>} parametersType 
     * @returns {HRESULT} 
     */
    GetGeneratorParametersType(parametersType) {
        result := ComCall(3, this, "int*", parametersType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} currentVersion 
     * @param {Pointer<UInt32>} minimumCompatibleAppVersion 
     * @returns {HRESULT} 
     */
    GetParametersVersion(currentVersion, minimumCompatibleAppVersion) {
        result := ComCall(4, this, "uint*", currentVersion, "uint*", minimumCompatibleAppVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} size 
     * @returns {HRESULT} 
     */
    GetSerializeSize(size) {
        result := ComCall(5, this, "uint*", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} size 
     * @param {Pointer<Byte>} parametersBlob 
     * @param {Pointer<UInt32>} bytesWritten 
     * @returns {HRESULT} 
     */
    Serialize(size, parametersBlob, bytesWritten) {
        result := ComCall(6, this, "uint", size, "char*", parametersBlob, "uint*", bytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
