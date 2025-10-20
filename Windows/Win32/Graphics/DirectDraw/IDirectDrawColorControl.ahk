#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirectDrawColorControl interface to get and set color controls.
 * @remarks
 * 
  * You can use the LPDIRECTDRAWCOLORCONTROL data type to declare a variable that contains a pointer to an <b>IDirectDrawColorControl</b> interface. The Ddraw.h header file declares this data type with the following code:
  * 
  * 
  * 
  * 
  * ```
  * 
  * typedef struct IDirectDrawColorControl    FAR *LPDIRECTDRAWCOLORCONTROL;
  * 
  * ```
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ddraw/nn-ddraw-idirectdrawcolorcontrol
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawColorControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawColorControl
     * @type {Guid}
     */
    static IID => Guid("{4b9f0ee0-0d7e-11d0-9b06-00a0c903a3b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColorControls", "SetColorControls"]

    /**
     * 
     * @param {Pointer<DDCOLORCONTROL>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawcolorcontrol-getcolorcontrols
     */
    GetColorControls(param0) {
        result := ComCall(3, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDCOLORCONTROL>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawcolorcontrol-setcolorcontrols
     */
    SetColorControls(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }
}
