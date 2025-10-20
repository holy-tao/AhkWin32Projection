#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPLibrary interface represents a library.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmplibrary
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPLibrary extends IUnknown{
    /**
     * The interface identifier for IWMPLibrary
     * @type {Guid}
     */
    static IID => Guid("{3df47861-7df1-4c1f-a81b-4c26f0f7a7c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_name(pbstrName) {
        result := ComCall(3, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pwmplt 
     * @returns {HRESULT} 
     */
    get_type(pwmplt) {
        result := ComCall(4, this, "int*", pwmplt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMediaCollection>} ppIWMPMediaCollection 
     * @returns {HRESULT} 
     */
    get_mediaCollection(ppIWMPMediaCollection) {
        result := ComCall(5, this, "ptr", ppIWMPMediaCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPLibrary>} pIWMPLibrary 
     * @param {Pointer<VARIANT_BOOL>} pvbool 
     * @returns {HRESULT} 
     */
    isIdentical(pIWMPLibrary, pvbool) {
        result := ComCall(6, this, "ptr", pIWMPLibrary, "ptr", pvbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
