#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataPackageView4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPackageView4
     * @type {Guid}
     */
    static IID => Guid("{dfe96f1f-e042-4433-a09f-26d6ffda8b85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAcceptedFormatId"]

    /**
     * 
     * @param {HSTRING} formatId 
     * @returns {HRESULT} 
     */
    SetAcceptedFormatId(formatId) {
        if(formatId is String) {
            pin := HSTRING.Create(formatId)
            formatId := pin.Value
        }
        formatId := formatId is Win32Handle ? NumGet(formatId, "ptr") : formatId

        result := ComCall(6, this, "ptr", formatId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
