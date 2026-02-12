#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\RepeatBehavior.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IRepeatBehaviorHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRepeatBehaviorHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{7a795033-79f3-4dd9-b267-9cf50fb51f84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Forever", "FromCount", "FromDuration", "GetHasCount", "GetHasDuration", "Equals"]

    /**
     * @type {RepeatBehavior} 
     */
    Forever {
        get => this.get_Forever()
    }

    /**
     * 
     * @returns {RepeatBehavior} 
     */
    get_Forever() {
        value := RepeatBehavior()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} count 
     * @returns {RepeatBehavior} 
     */
    FromCount(count) {
        result_ := RepeatBehavior()
        result := ComCall(7, this, "double", count, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {TimeSpan} duration_ 
     * @returns {RepeatBehavior} 
     */
    FromDuration(duration_) {
        result_ := RepeatBehavior()
        result := ComCall(8, this, "ptr", duration_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {RepeatBehavior} target 
     * @returns {Boolean} 
     */
    GetHasCount(target) {
        result := ComCall(9, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {RepeatBehavior} target 
     * @returns {Boolean} 
     */
    GetHasDuration(target) {
        result := ComCall(10, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {RepeatBehavior} target 
     * @param {RepeatBehavior} value 
     * @returns {Boolean} 
     */
    Equals(target, value) {
        result := ComCall(11, this, "ptr", target, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
