#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IUriActionEntity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUriActionEntity
     * @type {Guid}
     */
    static IID => Guid("{a81cde77-bc25-532d-905e-b0725c5bcd4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uri"]

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }
}
