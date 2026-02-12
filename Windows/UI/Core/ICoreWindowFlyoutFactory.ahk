#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CoreWindowFlyout.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWindowFlyoutFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindowFlyoutFactory
     * @type {Guid}
     */
    static IID => Guid("{dec4c6c4-93e8-4f7c-be27-cefaa1af68a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithTitle"]

    /**
     * Create Extended Stored Procedures
     * @param {POINT} position 
     * @returns {CoreWindowFlyout} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(position) {
        result := ComCall(6, this, "ptr", position, "ptr*", &coreWindowFlyout_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreWindowFlyout(coreWindowFlyout_)
    }

    /**
     * 
     * @param {POINT} position 
     * @param {HSTRING} title 
     * @returns {CoreWindowFlyout} 
     */
    CreateWithTitle(position, title) {
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title

        result := ComCall(7, this, "ptr", position, "ptr", title, "ptr*", &coreWindowFlyout_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreWindowFlyout(coreWindowFlyout_)
    }
}
