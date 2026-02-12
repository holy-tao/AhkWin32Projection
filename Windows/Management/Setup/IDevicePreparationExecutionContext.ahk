#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class IDevicePreparationExecutionContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePreparationExecutionContext
     * @type {Guid}
     */
    static IID => Guid("{084f221b-2484-5e81-a4e7-83f6caf19dc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Context"]

    /**
     * @type {HSTRING} 
     */
    Context {
        get => this.get_Context()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Context() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
