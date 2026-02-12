#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\BackgroundTransferContentPart.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates a [BackgroundTransferContentPart](backgroundtransfercontentpart.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransfercontentpartfactory
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundTransferContentPartFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTransferContentPartFactory
     * @type {Guid}
     */
    static IID => Guid("{90ef98a9-7a01-4a0b-9f80-a0b0bb370f8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithName", "CreateWithNameAndFileName"]

    /**
     * Creates a [BackgroundTransferContentPart](backgroundtransfercontentpart.md) object that indicates the specified content type.
     * @param {HSTRING} name Identifies the content type.
     * @returns {BackgroundTransferContentPart} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransfercontentpartfactory.createwithname
     */
    CreateWithName(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundTransferContentPart(value)
    }

    /**
     * Creates a [BackgroundTransferContentPart](backgroundtransfercontentpart.md) object that identifies the content type and name of the file.
     * @param {HSTRING} name Identifies the content type.
     * @param {HSTRING} fileName The fully qualified file name; this includes the local path.
     * @returns {BackgroundTransferContentPart} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransfercontentpartfactory.createwithnameandfilename
     */
    CreateWithNameAndFileName(name, fileName) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(fileName is String) {
            pin := HSTRING.Create(fileName)
            fileName := pin.Value
        }
        fileName := fileName is Win32Handle ? NumGet(fileName, "ptr") : fileName

        result := ComCall(7, this, "ptr", name, "ptr", fileName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundTransferContentPart(value)
    }
}
