#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class IMicrosoftAccountMultiFactorOneTimeCodedInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMicrosoftAccountMultiFactorOneTimeCodedInfo
     * @type {Guid}
     */
    static IID => Guid("{82ba264b-d87c-4668-a976-40cfae547d08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Code", "get_TimeInterval", "get_TimeToLive", "get_ServiceResponse"]

    /**
     * @type {HSTRING} 
     */
    Code {
        get => this.get_Code()
    }

    /**
     * @type {TimeSpan} 
     */
    TimeInterval {
        get => this.get_TimeInterval()
    }

    /**
     * @type {TimeSpan} 
     */
    TimeToLive {
        get => this.get_TimeToLive()
    }

    /**
     * @type {Integer} 
     */
    ServiceResponse {
        get => this.get_ServiceResponse()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Code() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TimeInterval() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TimeToLive() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceResponse() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
