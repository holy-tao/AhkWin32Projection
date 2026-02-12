#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement.Preview
 * @version WindowsRuntime 1.4
 */
class IWindowManagementPreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowManagementPreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{0f9725c6-c004-5a23-8fd2-8d092ce2704a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPreferredMinSize"]

    /**
     * 
     * @param {AppWindow} window_ 
     * @param {SIZE} preferredFrameMinSize 
     * @returns {HRESULT} 
     */
    SetPreferredMinSize(window_, preferredFrameMinSize) {
        result := ComCall(6, this, "ptr", window_, "ptr", preferredFrameMinSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
