#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Duration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDurationHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDurationHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{bc88093e-3547-4ec0-b519-ffa8f9c4838c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Automatic", "get_Forever", "Compare", "FromTimeSpan", "GetHasTimeSpan", "Add", "Equals", "Subtract"]

    /**
     * @type {Duration} 
     */
    Automatic {
        get => this.get_Automatic()
    }

    /**
     * @type {Duration} 
     */
    Forever {
        get => this.get_Forever()
    }

    /**
     * 
     * @returns {Duration} 
     */
    get_Automatic() {
        value := Duration()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Duration} 
     */
    get_Forever() {
        value := Duration()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * The CompareAddresses function compares two addresses, indicating that one of the addresses is greater than, less than, or equal to the other address.
     * @remarks
     * An address that is less than another address indicates a previous frame. An address that is greater than another address indicates a later frame.
     * 
     * Network Monitor provides two other functions, [CompareFrameDestAddress](compareframedestaddress.md) and [CompareFrameSourceAddress](compareframesourceaddress.md), which you can use to compare addresses. The **CompareFrameDestAddress** function compares a given address to the frame's destination address, and the **CompareFrameSourceAddress** function compares a given address to the frame's source address.
     * @param {Duration} duration1 
     * @param {Duration} duration2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/compareaddresses
     */
    Compare(duration1, duration2) {
        result := ComCall(8, this, "ptr", duration1, "ptr", duration2, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {TimeSpan} timeSpan_ 
     * @returns {Duration} 
     */
    FromTimeSpan(timeSpan_) {
        result_ := Duration()
        result := ComCall(9, this, "ptr", timeSpan_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Duration} target 
     * @returns {Boolean} 
     */
    GetHasTimeSpan(target) {
        result := ComCall(10, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {Duration} target 
     * @param {Duration} duration_ 
     * @returns {Duration} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(target, duration_) {
        result_ := Duration()
        result := ComCall(11, this, "ptr", target, "ptr", duration_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Duration} target 
     * @param {Duration} value 
     * @returns {Boolean} 
     */
    Equals(target, value) {
        result := ComCall(12, this, "ptr", target, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * The SubtractRect function determines the coordinates of a rectangle formed by subtracting one rectangle from another.
     * @remarks
     * The function only subtracts the rectangle specified by <i>lprcSrc2</i> from the rectangle specified by <i>lprcSrc1</i> when the rectangles intersect completely in either the x- or y-direction. For example, if *<i>lprcSrc1</i> has the coordinates (10,10,100,100) and *<i>lprcSrc2</i> has the coordinates (50,50,150,150), the function sets the coordinates of the rectangle pointed to by <i>lprcDst</i> to (10,10,100,100). If *<i>lprcSrc1</i> has the coordinates (10,10,100,100) and *<i>lprcSrc2</i> has the coordinates (50,10,150,150), however, the function sets the coordinates of the rectangle pointed to by <i>lprcDst</i> to (10,10,50,100). In other words, the resulting rectangle is the bounding box of the geometric difference.
     * 
     * Because applications can use rectangles for different purposes, the rectangle functions do not use an explicit unit of measure. Instead, all rectangle coordinates and dimensions are given in signed, logical values. The mapping mode and the function in which the rectangle is used determine the units of measure.
     * @param {Duration} target 
     * @param {Duration} duration_ 
     * @returns {Duration} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-subtractrect
     */
    Subtract(target, duration_) {
        result_ := Duration()
        result := ComCall(13, this, "ptr", target, "ptr", duration_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
