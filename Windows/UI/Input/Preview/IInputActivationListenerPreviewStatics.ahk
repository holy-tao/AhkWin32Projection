#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\InputActivationListener.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview
 * @version WindowsRuntime 1.4
 */
class IInputActivationListenerPreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputActivationListenerPreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{f0551ce5-0de6-5be0-a589-f737201a4582}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForApplicationWindow"]

    /**
     * 
     * @param {AppWindow} window_ 
     * @returns {InputActivationListener} 
     */
    CreateForApplicationWindow(window_) {
        result := ComCall(6, this, "ptr", window_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InputActivationListener(result_)
    }
}
