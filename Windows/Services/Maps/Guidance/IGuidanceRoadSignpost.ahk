#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\UI\Color.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceRoadSignpost extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceRoadSignpost
     * @type {Guid}
     */
    static IID => Guid("{f1a728b6-f77a-4742-8312-53300f9845f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExitNumber", "get_Exit", "get_BackgroundColor", "get_ForegroundColor", "get_ExitDirections"]

    /**
     * @type {HSTRING} 
     */
    ExitNumber {
        get => this.get_ExitNumber()
    }

    /**
     * @type {HSTRING} 
     */
    Exit {
        get => this.get_Exit()
    }

    /**
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
    }

    /**
     * @type {Color} 
     */
    ForegroundColor {
        get => this.get_ForegroundColor()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    ExitDirections {
        get => this.get_ExitDirections()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExitNumber() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Exit() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        value := Color()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_ForegroundColor() {
        value := Color()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_ExitDirections() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
