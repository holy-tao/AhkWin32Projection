#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStreamSample.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//ddstream/nn-ddstream-idirectdrawstreamsample
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDirectDrawStreamSample extends IStreamSample{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawStreamSample
     * @type {Guid}
     */
    static IID => Guid("{f4104fcf-9a70-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSurface", "SetRect"]

    /**
     * 
     * @param {Pointer<IDirectDrawSurface>} ppDirectDrawSurface 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddstream/nf-ddstream-idirectdrawstreamsample-getsurface
     */
    GetSurface(ppDirectDrawSurface, pRect) {
        result := ComCall(8, this, "ptr*", ppDirectDrawSurface, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * The SetRect function sets the coordinates of the specified rectangle. This is equivalent to assigning the left, top, right, and bottom arguments to the appropriate members of the RECT structure.
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setrect
     */
    SetRect(pRect) {
        result := ComCall(9, this, "ptr", pRect, "HRESULT")
        return result
    }
}
