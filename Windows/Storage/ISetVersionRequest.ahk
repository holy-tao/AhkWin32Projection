#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\SetVersionDeferral.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ISetVersionRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISetVersionRequest
     * @type {Guid}
     */
    static IID => Guid("{b9c76b9b-1056-4e69-8330-162619956f9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentVersion", "get_DesiredVersion", "GetDeferral"]

    /**
     * @type {Integer} 
     */
    CurrentVersion {
        get => this.get_CurrentVersion()
    }

    /**
     * @type {Integer} 
     */
    DesiredVersion {
        get => this.get_DesiredVersion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentVersion() {
        result := ComCall(6, this, "uint*", &currentVersion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return currentVersion
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredVersion() {
        result := ComCall(7, this, "uint*", &desiredVersion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return desiredVersion
    }

    /**
     * 
     * @returns {SetVersionDeferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SetVersionDeferral(deferral_)
    }
}
