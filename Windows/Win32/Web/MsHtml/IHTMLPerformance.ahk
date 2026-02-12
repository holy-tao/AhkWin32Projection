#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLPerformanceNavigation.ahk
#Include .\IHTMLPerformanceTiming.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLPerformance extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLPerformance
     * @type {Guid}
     */
    static IID => Guid("{3051074e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLPerformance
     * @type {Guid}
     */
    static CLSID => Guid("{3051074f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_navigation", "get_timing", "toString", "toJSON"]

    /**
     * @type {IHTMLPerformanceNavigation} 
     */
    navigation {
        get => this.get_navigation()
    }

    /**
     * @type {IHTMLPerformanceTiming} 
     */
    timing {
        get => this.get_timing()
    }

    /**
     * 
     * @returns {IHTMLPerformanceNavigation} 
     */
    get_navigation() {
        result := ComCall(7, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLPerformanceNavigation(p)
    }

    /**
     * 
     * @returns {IHTMLPerformanceTiming} 
     */
    get_timing() {
        result := ComCall(8, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLPerformanceTiming(p)
    }

    /**
     * toString Method (DateTimeOffset)
     * @remarks
     * The string has the format `YYYY-MM-DD HH:mm:ss[.fffffff] [+|-]HH:mm`.  
     *   
     *  The fractional seconds of the returned string are zero padded to the declared precision. For example, a **datetimeoffset(6)** with a value of "2010-03-10 12:34:56.78 -08:00" will be formatted by DateTimeOffset.toString as "2010-03-10 12:34:56.780000 -08:00".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/tostring-method-datetimeoffset
     */
    toString() {
        string_ := BSTR()
        result := ComCall(9, this, "ptr", string_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return string_
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    toJSON() {
        pVar := VARIANT()
        result := ComCall(10, this, "ptr", pVar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVar
    }
}
