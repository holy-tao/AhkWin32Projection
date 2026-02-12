#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UnhandledError.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class IUnhandledErrorDetectedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUnhandledErrorDetectedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{679ab78b-b336-4822-ac40-0d750f0b7a2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnhandledError"]

    /**
     * @type {UnhandledError} 
     */
    UnhandledError {
        get => this.get_UnhandledError()
    }

    /**
     * 
     * @returns {UnhandledError} 
     */
    get_UnhandledError() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UnhandledError(value)
    }
}
