#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CoreWindowDialog.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWindowDialogFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindowDialogFactory
     * @type {Guid}
     */
    static IID => Guid("{cfb2a855-1c59-4b13-b1e5-16e29805f7c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithTitle"]

    /**
     * 
     * @param {HSTRING} title 
     * @returns {CoreWindowDialog} 
     */
    CreateWithTitle(title) {
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title

        result := ComCall(6, this, "ptr", title, "ptr*", &coreWindowDialog_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreWindowDialog(coreWindowDialog_)
    }
}
