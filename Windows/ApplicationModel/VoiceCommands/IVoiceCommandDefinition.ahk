#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class IVoiceCommandDefinition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoiceCommandDefinition
     * @type {Guid}
     */
    static IID => Guid("{7972aad0-0974-4979-984b-cb8959cd61ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Language", "get_Name", "SetPhraseListAsync"]

    /**
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} phraseListName 
     * @param {IIterable<HSTRING>} phraseList 
     * @returns {IAsyncAction} 
     */
    SetPhraseListAsync(phraseListName, phraseList) {
        if(phraseListName is String) {
            pin := HSTRING.Create(phraseListName)
            phraseListName := pin.Value
        }
        phraseListName := phraseListName is Win32Handle ? NumGet(phraseListName, "ptr") : phraseListName

        result := ComCall(8, this, "ptr", phraseListName, "ptr", phraseList, "ptr*", &updateAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(updateAction)
    }
}
