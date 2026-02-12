#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CustomTextActionEntity.ahk
#Include .\ArrayActionEntity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionEntityFactory7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionEntityFactory7
     * @type {Guid}
     */
    static IID => Guid("{b814b8d5-c9b2-51b5-a342-9fe054d8a1eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCustomTextEntity", "CreateArrayEntityWithCustomKind"]

    /**
     * 
     * @param {HSTRING} kind 
     * @param {HSTRING} keyPhrase 
     * @param {IMapView<HSTRING, IInspectable>} props 
     * @returns {CustomTextActionEntity} 
     */
    CreateCustomTextEntity(kind, keyPhrase, props) {
        if(kind is String) {
            pin := HSTRING.Create(kind)
            kind := pin.Value
        }
        kind := kind is Win32Handle ? NumGet(kind, "ptr") : kind
        if(keyPhrase is String) {
            pin := HSTRING.Create(keyPhrase)
            keyPhrase := pin.Value
        }
        keyPhrase := keyPhrase is Win32Handle ? NumGet(keyPhrase, "ptr") : keyPhrase

        result := ComCall(6, this, "ptr", kind, "ptr", keyPhrase, "ptr", props, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CustomTextActionEntity(result_)
    }

    /**
     * 
     * @param {Integer} elementKind 
     * @param {HSTRING} customKind 
     * @param {Integer} entities_length 
     * @param {Pointer<ActionEntity>} entities 
     * @returns {ArrayActionEntity} 
     */
    CreateArrayEntityWithCustomKind(elementKind, customKind, entities_length, entities) {
        if(customKind is String) {
            pin := HSTRING.Create(customKind)
            customKind := pin.Value
        }
        customKind := customKind is Win32Handle ? NumGet(customKind, "ptr") : customKind

        result := ComCall(7, this, "int", elementKind, "ptr", customKind, "uint", entities_length, "ptr*", entities, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ArrayActionEntity(result_)
    }
}
