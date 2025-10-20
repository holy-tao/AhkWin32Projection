#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAVIEditStream interface supports manipulating and modifying editable streams. Uses IUnknown::QueryInterface, IUnknown::AddRef, IUnknown::Release in addition to the following custom methods:\_
 * @see https://docs.microsoft.com/windows/win32/api//vfw/nn-vfw-iavieditstream
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class IAVIEditStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAVIEditStream
     * @type {Guid}
     */
    static IID => Guid("{00020024-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cut", "Copy", "Paste", "Clone", "SetInfo"]

    /**
     * 
     * @param {Pointer<Integer>} plStart 
     * @param {Pointer<Integer>} plLength 
     * @param {Pointer<IAVIStream>} ppResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavieditstream-cut
     */
    Cut(plStart, plLength, ppResult) {
        result := ComCall(3, this, "int*", plStart, "int*", plLength, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plStart 
     * @param {Pointer<Integer>} plLength 
     * @param {Pointer<IAVIStream>} ppResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavieditstream-copy
     */
    Copy(plStart, plLength, ppResult) {
        result := ComCall(4, this, "int*", plStart, "int*", plLength, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPos 
     * @param {Pointer<Integer>} plLength 
     * @param {IAVIStream} pstream 
     * @param {Integer} lStart 
     * @param {Integer} lEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavieditstream-paste
     */
    Paste(plPos, plLength, pstream, lStart, lEnd) {
        result := ComCall(5, this, "int*", plPos, "int*", plLength, "ptr", pstream, "int", lStart, "int", lEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAVIStream>} ppResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavieditstream-clone
     */
    Clone(ppResult) {
        result := ComCall(6, this, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} lpInfo 
     * @param {Integer} cbInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavieditstream-setinfo
     */
    SetInfo(lpInfo, cbInfo) {
        result := ComCall(7, this, "ptr", lpInfo, "int", cbInfo, "HRESULT")
        return result
    }
}
