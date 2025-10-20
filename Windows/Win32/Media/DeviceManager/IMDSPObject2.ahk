#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPObject.ahk

/**
 * Windows Media Device Manager uses IMDSPObject2 to enable more efficient file reading and writing.Note  Unless the service provider has added the device parameter UseExtendedWmdm with a value of 1, Windows Media Device Manager will not call this interface. See Device Parameters for more information about this. .
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspobject2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPObject2 extends IMDSPObject{
    /**
     * The interface identifier for IMDSPObject2
     * @type {Guid}
     */
    static IID => Guid("{3f34cd3e-5907-4341-9af9-97f4187c3aa5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<Byte>} pData 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    ReadOnClearChannel(pData, pdwSize) {
        result := ComCall(11, this, "char*", pData, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pData 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    WriteOnClearChannel(pData, pdwSize) {
        result := ComCall(12, this, "char*", pData, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
