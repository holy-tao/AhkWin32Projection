#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\Printing\PrintTaskOptions.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Printing
 * @version WindowsRuntime 1.4
 */
class IAddPagesEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAddPagesEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e2e52be5-056c-4420-9795-cb3526ce0c20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrintTaskOptions"]

    /**
     * @type {PrintTaskOptions} 
     */
    PrintTaskOptions {
        get => this.get_PrintTaskOptions()
    }

    /**
     * 
     * @returns {PrintTaskOptions} 
     */
    get_PrintTaskOptions() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTaskOptions(value)
    }
}
