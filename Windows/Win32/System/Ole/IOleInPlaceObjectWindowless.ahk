#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDropTarget.ahk
#Include .\IOleInPlaceObject.ahk

/**
 * Enables a windowless object to process window messages and participate in drag and drop operations. It is derived from and extends the IOleInPlaceObject interface.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ioleinplaceobjectwindowless
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceObjectWindowless extends IOleInPlaceObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceObjectWindowless
     * @type {Guid}
     */
    static IID => Guid("{1c2056cc-5ef4-101b-8bc8-00aa003e3b29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnWindowMessage", "GetDropTarget"]

    /**
     * 
     * @param {Integer} msg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {LRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplaceobjectwindowless-onwindowmessage
     */
    OnWindowMessage(msg, wParam, lParam) {
        result := ComCall(9, this, "uint", msg, "ptr", wParam, "ptr", lParam, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @returns {IDropTarget} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplaceobjectwindowless-getdroptarget
     */
    GetDropTarget() {
        result := ComCall(10, this, "ptr*", &ppDropTarget := 0, "HRESULT")
        return IDropTarget(ppDropTarget)
    }
}
