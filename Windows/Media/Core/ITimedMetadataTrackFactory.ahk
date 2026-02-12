#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\TimedMetadataTrack.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedMetadataTrackFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedMetadataTrackFactory
     * @type {Guid}
     */
    static IID => Guid("{8dd57611-97b3-4e1f-852c-0f482c81ad26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} id 
     * @param {HSTRING} language_ 
     * @param {Integer} kind 
     * @returns {TimedMetadataTrack} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(id, language_, kind) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id
        if(language_ is String) {
            pin := HSTRING.Create(language_)
            language_ := pin.Value
        }
        language_ := language_ is Win32Handle ? NumGet(language_, "ptr") : language_

        result := ComCall(6, this, "ptr", id, "ptr", language_, "int", kind, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedMetadataTrack(value)
    }
}
