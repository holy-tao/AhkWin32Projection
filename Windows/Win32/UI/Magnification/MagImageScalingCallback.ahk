#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Prototype for a callback function that implements a custom transform for image scaling.
 * @see https://learn.microsoft.com/windows/win32/api//content/magnification/nc-magnification-magimagescalingcallback
 * @namespace Windows.Win32.UI.Magnification
 * @version v4.0.30319
 */
class MagImageScalingCallback extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HWND} hwnd_ 
     * @param {Pointer<Void>} srcdata 
     * @param {MAGIMAGEHEADER} srcheader 
     * @param {Pointer<Void>} destdata 
     * @param {MAGIMAGEHEADER} destheader 
     * @param {RECT} unclipped 
     * @param {RECT} clipped 
     * @param {HRGN} dirty 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hwnd_, srcdata, srcheader, destdata, destheader, unclipped, clipped, dirty) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        dirty := dirty is Win32Handle ? NumGet(dirty, "ptr") : dirty

        srcdataMarshal := srcdata is VarRef ? "ptr" : "ptr"
        destdataMarshal := destdata is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hwnd_, srcdataMarshal, srcdata, "ptr", srcheader, destdataMarshal, destdata, "ptr", destheader, "ptr", unclipped, "ptr", clipped, "ptr", dirty, "int")
        return result
    }
}
