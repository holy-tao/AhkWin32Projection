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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_name", "get_type", "get_mediaCollection", "isIdentical"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrary-get_name
     */
    get_name(pbstrName) {
        result := ComCall(3, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwmplt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrary-get_type
     */
    get_type(pwmplt) {
        pwmpltMarshal := pwmplt is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pwmpltMarshal, pwmplt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMediaCollection>} ppIWMPMediaCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrary-get_mediacollection
     */
    get_mediaCollection(ppIWMPMediaCollection) {
        result := ComCall(5, this, "ptr*", ppIWMPMediaCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPLibrary} pIWMPLibrary 
     * @param {Pointer<VARIANT_BOOL>} pvbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrary-isidentical
     */
    isIdentical(pIWMPLibrary, pvbool) {
        result := ComCall(6, this, "ptr", pIWMPLibrary, "ptr", pvbool, "HRESULT")
        return result
    }
}
