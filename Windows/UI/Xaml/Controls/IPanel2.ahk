#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\BrushTransition.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPanel2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPanel2
     * @type {Guid}
     */
    static IID => Guid("{709133c7-38f3-5083-a4bb-06a548a1d231}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackgroundTransition", "put_BackgroundTransition"]

    /**
     * @type {BrushTransition} 
     */
    BackgroundTransition {
        get => this.get_BackgroundTransition()
        set => this.put_BackgroundTransition(value)
    }

    /**
     * 
     * @returns {BrushTransition} 
     */
    get_BackgroundTransition() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BrushTransition(value)
    }

    /**
     * 
     * @param {BrushTransition} value 
     * @returns {HRESULT} 
     */
    put_BackgroundTransition(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
