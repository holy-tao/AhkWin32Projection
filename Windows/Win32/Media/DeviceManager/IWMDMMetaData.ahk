#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMMetaData interface sets and retrieves metadata properties (such as artist, album, genre, and so on) of a storage.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmmetadata
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMMetaData extends IUnknown{
    /**
     * The interface identifier for IWMDMMetaData
     * @type {Guid}
     */
    static IID => Guid("{ec3b0663-0951-460a-9a80-0dceed3c043c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Type 
     * @param {PWSTR} pwszTagName 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} iLength 
     * @returns {HRESULT} 
     */
    AddItem(Type, pwszTagName, pValue, iLength) {
        pwszTagName := pwszTagName is String ? StrPtr(pwszTagName) : pwszTagName

        result := ComCall(3, this, "int", Type, "ptr", pwszTagName, "char*", pValue, "uint", iLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszTagName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt32>} pcbLength 
     * @returns {HRESULT} 
     */
    QueryByName(pwszTagName, pType, pValue, pcbLength) {
        pwszTagName := pwszTagName is String ? StrPtr(pwszTagName) : pwszTagName

        result := ComCall(4, this, "ptr", pwszTagName, "int*", pType, "char*", pValue, "uint*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<UInt16>} ppwszName 
     * @param {Pointer<Int32>} pType 
     * @param {Pointer<Byte>} ppValue 
     * @param {Pointer<UInt32>} pcbLength 
     * @returns {HRESULT} 
     */
    QueryByIndex(iIndex, ppwszName, pType, ppValue, pcbLength) {
        result := ComCall(5, this, "uint", iIndex, "ushort*", ppwszName, "int*", pType, "char*", ppValue, "uint*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} iCount 
     * @returns {HRESULT} 
     */
    GetItemCount(iCount) {
        result := ComCall(6, this, "uint*", iCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
