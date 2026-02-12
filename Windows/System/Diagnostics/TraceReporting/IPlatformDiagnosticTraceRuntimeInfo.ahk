#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class IPlatformDiagnosticTraceRuntimeInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlatformDiagnosticTraceRuntimeInfo
     * @type {Guid}
     */
    static IID => Guid("{3d4d5e2d-01d8-4768-8554-1eb1ca610986}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RuntimeFileTime", "get_EtwRuntimeFileTime"]

    /**
     * @type {Integer} 
     */
    RuntimeFileTime {
        get => this.get_RuntimeFileTime()
    }

    /**
     * @type {Integer} 
     */
    EtwRuntimeFileTime {
        get => this.get_EtwRuntimeFileTime()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RuntimeFileTime() {
        result := ComCall(6, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EtwRuntimeFileTime() {
        result := ComCall(7, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
