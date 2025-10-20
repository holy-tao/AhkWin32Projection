#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) short event descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbshorteventdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbShortEventDescriptor extends IUnknown{
    /**
     * The interface identifier for IDvbShortEventDescriptor
     * @type {Guid}
     */
    static IID => Guid("{b170be92-5b75-458e-9c6e-b0008231491a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pszCode 
     * @returns {HRESULT} 
     */
    GetLanguageCode(pszCode) {
        result := ComCall(5, this, "char*", pszCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetEventNameW(convMode, pbstrName) {
        result := ComCall(6, this, "int", convMode, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrText 
     * @returns {HRESULT} 
     */
    GetTextW(convMode, pbstrText) {
        result := ComCall(7, this, "int", convMode, "ptr", pbstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
