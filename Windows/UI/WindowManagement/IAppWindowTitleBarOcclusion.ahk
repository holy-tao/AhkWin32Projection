#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowTitleBarOcclusion extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowTitleBarOcclusion
     * @type {Guid}
     */
    static IID => Guid("{fea3cffd-2ccf-5fc3-aeae-f843876bf37e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OccludingRect"]

    /**
     * @type {RECT} 
     */
    OccludingRect {
        get => this.get_OccludingRect()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_OccludingRect() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
