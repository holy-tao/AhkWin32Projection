#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\InputPane.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IInputPaneStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputPaneStatics
     * @type {Guid}
     */
    static IID => Guid("{95f4af3a-ef47-424a-9741-fd2815eba2bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView"]

    /**
     * 
     * @returns {InputPane} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &inputPane_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InputPane(inputPane_)
    }
}
