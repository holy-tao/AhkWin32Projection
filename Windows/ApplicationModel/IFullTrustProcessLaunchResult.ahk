#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IFullTrustProcessLaunchResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFullTrustProcessLaunchResult
     * @type {Guid}
     */
    static IID => Guid("{8917d888-edfb-515f-8e22-5ebceb69dfd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LaunchResult", "get_ExtendedError"]

    /**
     * @type {Integer} 
     */
    LaunchResult {
        get => this.get_LaunchResult()
    }

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LaunchResult() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
