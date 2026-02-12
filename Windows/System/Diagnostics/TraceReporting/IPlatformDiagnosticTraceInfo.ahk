#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class IPlatformDiagnosticTraceInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlatformDiagnosticTraceInfo
     * @type {Guid}
     */
    static IID => Guid("{f870ed97-d597-4bf7-88dc-cf5c7dc2a1d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ScenarioId", "get_ProfileHash", "get_IsExclusive", "get_IsAutoLogger", "get_MaxTraceDurationFileTime", "get_Priority"]

    /**
     * @type {Guid} 
     */
    ScenarioId {
        get => this.get_ScenarioId()
    }

    /**
     * @type {Integer} 
     */
    ProfileHash {
        get => this.get_ProfileHash()
    }

    /**
     * @type {Boolean} 
     */
    IsExclusive {
        get => this.get_IsExclusive()
    }

    /**
     * @type {Boolean} 
     */
    IsAutoLogger {
        get => this.get_IsAutoLogger()
    }

    /**
     * @type {Integer} 
     */
    MaxTraceDurationFileTime {
        get => this.get_MaxTraceDurationFileTime()
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ScenarioId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProfileHash() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExclusive() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutoLogger() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxTraceDurationFileTime() {
        result := ComCall(10, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
