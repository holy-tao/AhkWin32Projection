#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostContext.ahk
#Include ..\..\..\Variant\VARIANT.ahk
#Include .\IKeyEnumerator.ahk
#Include .\IModelObject.ahk
#Include .\IRawEnumerator.ahk
#Include .\Location.ahk
#Include .\IDebugHostType.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IModelObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IModelObject
     * @type {Guid}
     */
    static IID => Guid("{e28c7893-3f4b-4b96-baca-293cdc55f45d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContext", "GetKind", "GetIntrinsicValue", "GetIntrinsicValueAs", "GetKeyValue", "SetKeyValue", "EnumerateKeyValues", "GetRawValue", "EnumerateRawValues", "Dereference", "TryCastToRuntimeType", "GetConcept", "GetLocation", "GetTypeInfo", "GetTargetInfo", "GetNumberOfParentModels", "GetParentModel", "AddParentModel", "RemoveParentModel", "GetKey", "GetKeyReference", "SetKey", "ClearKeys", "EnumerateKeys", "EnumerateKeyReferences", "SetConcept", "ClearConcepts", "GetRawReference", "EnumerateRawReferences", "SetContextForDataModel", "GetContextForDataModel", "Compare", "IsEqualTo"]

    /**
     * Gets the context preference flags.
     * @returns {IDebugHostContext} 
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getcontextpreferenceflags
     */
    GetContext() {
        result := ComCall(3, this, "ptr*", &_context := 0, "HRESULT")
        return IDebugHostContext(_context)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetKind() {
        result := ComCall(4, this, "int*", &kind := 0, "HRESULT")
        return kind
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    GetIntrinsicValue() {
        intrinsicData := VARIANT()
        result := ComCall(5, this, "ptr", intrinsicData, "HRESULT")
        return intrinsicData
    }

    /**
     * 
     * @param {Integer} vt 
     * @returns {VARIANT} 
     */
    GetIntrinsicValueAs(vt) {
        intrinsicData := VARIANT()
        result := ComCall(6, this, "ushort", vt, "ptr", intrinsicData, "HRESULT")
        return intrinsicData
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKeyValue(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(7, this, "ptr", key, "ptr*", _object, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} _object 
     * @returns {HRESULT} 
     */
    SetKeyValue(key, _object) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(8, this, "ptr", key, "ptr", _object, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IKeyEnumerator} 
     */
    EnumerateKeyValues() {
        result := ComCall(9, this, "ptr*", &_enumerator := 0, "HRESULT")
        return IKeyEnumerator(_enumerator)
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {PWSTR} name 
     * @param {Integer} searchFlags 
     * @returns {IModelObject} 
     */
    GetRawValue(kind, name, searchFlags) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(10, this, "int", kind, "ptr", name, "uint", searchFlags, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Integer} searchFlags 
     * @returns {IRawEnumerator} 
     */
    EnumerateRawValues(kind, searchFlags) {
        result := ComCall(11, this, "int", kind, "uint", searchFlags, "ptr*", &_enumerator := 0, "HRESULT")
        return IRawEnumerator(_enumerator)
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    Dereference() {
        result := ComCall(12, this, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @returns {IModelObject} 
     */
    TryCastToRuntimeType() {
        result := ComCall(13, this, "ptr*", &runtimeTypedObject := 0, "HRESULT")
        return IModelObject(runtimeTypedObject)
    }

    /**
     * 
     * @param {Pointer<Guid>} conceptId 
     * @param {Pointer<IUnknown>} conceptInterface 
     * @param {Pointer<IKeyStore>} conceptMetadata 
     * @returns {HRESULT} 
     */
    GetConcept(conceptId, conceptInterface, conceptMetadata) {
        result := ComCall(14, this, "ptr", conceptId, "ptr*", conceptInterface, "ptr*", conceptMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Location} 
     */
    GetLocation() {
        _location := Location()
        result := ComCall(15, this, "ptr", _location, "HRESULT")
        return _location
    }

    /**
     * 
     * @returns {IDebugHostType} 
     */
    GetTypeInfo() {
        result := ComCall(16, this, "ptr*", &type := 0, "HRESULT")
        return IDebugHostType(type)
    }

    /**
     * 
     * @param {Pointer<Location>} _location 
     * @param {Pointer<IDebugHostType>} type 
     * @returns {HRESULT} 
     */
    GetTargetInfo(_location, type) {
        result := ComCall(17, this, "ptr", _location, "ptr*", type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberOfParentModels() {
        result := ComCall(18, this, "uint*", &numModels := 0, "HRESULT")
        return numModels
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<IModelObject>} model 
     * @param {Pointer<IModelObject>} contextObject 
     * @returns {HRESULT} 
     */
    GetParentModel(i, model, contextObject) {
        result := ComCall(19, this, "uint", i, "ptr*", model, "ptr*", contextObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} model 
     * @param {IModelObject} contextObject 
     * @param {Integer} override 
     * @returns {HRESULT} 
     */
    AddParentModel(model, contextObject, override) {
        result := ComCall(20, this, "ptr", model, "ptr", contextObject, "char", override, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} model 
     * @returns {HRESULT} 
     */
    RemoveParentModel(model) {
        result := ComCall(21, this, "ptr", model, "HRESULT")
        return result
    }

    /**
     * Retrieves the active input locale identifier (formerly called the keyboard layout).
     * @remarks
     * The input locale identifier is a broader concept than a keyboard layout, since it can also encompass a speech-to-text converter, an Input Method Editor (IME), or any other form of input.
     * 
     * Since the keyboard layout can be dynamically changed, applications that cache information about the current keyboard layout should process the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-inputlangchange">WM_INPUTLANGCHANGE</a> message to be informed of changes in the input language.
     * 
     * To get the KLID (keyboard layout ID) of the currently active HKL, call the  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeyboardlayoutnamea">GetKeyboardLayoutName</a>.
     * 
     * <b>Beginning in Windows 8:</b> The preferred method to retrieve the language associated with the current keyboard layout or input method is a call to <a href="https://docs.microsoft.com/uwp/api/windows.globalization.language.currentinputmethodlanguagetag">Windows.Globalization.Language.CurrentInputMethodLanguageTag</a>. If your app passes language tags from <b>CurrentInputMethodLanguageTag</b> to any <a href="https://docs.microsoft.com/windows/desktop/Intl/national-language-support-functions">National Language Support</a> functions, it must first convert the tags by calling <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-resolvelocalename">ResolveLocaleName</a>.
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} Type: <b>HKL</b>
     * 
     * The return value is the input locale identifier for the thread. The low word contains a <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifier</a> for the input language and the high word contains a device handle to the physical layout of the keyboard.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getkeyboardlayout
     */
    GetKey(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(22, this, "ptr", key, "ptr*", _object, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} objectReference 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKeyReference(key, objectReference, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(23, this, "ptr", key, "ptr*", objectReference, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * Copies an array of keyboard key states into the calling thread's keyboard input-state table. This is the same table accessed by the GetKeyboardState and GetKeyState functions. Changes made to this table do not affect keyboard input to any other thread.
     * @remarks
     * Because the <b>SetKeyboardState</b> function alters the input state of the calling thread and not the global input state of the system, an application cannot use <b>SetKeyboardState</b> to set the NUM LOCK, CAPS LOCK, or SCROLL LOCK (or the Japanese KANA) indicator lights on the keyboard. These can be set or cleared using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendinput">SendInput</a> to simulate keystrokes.
     * @param {PWSTR} key 
     * @param {IModelObject} _object 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setkeyboardstate
     */
    SetKey(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(24, this, "ptr", key, "ptr", _object, "ptr", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearKeys() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IKeyEnumerator} 
     */
    EnumerateKeys() {
        result := ComCall(26, this, "ptr*", &_enumerator := 0, "HRESULT")
        return IKeyEnumerator(_enumerator)
    }

    /**
     * 
     * @returns {IKeyEnumerator} 
     */
    EnumerateKeyReferences() {
        result := ComCall(27, this, "ptr*", &_enumerator := 0, "HRESULT")
        return IKeyEnumerator(_enumerator)
    }

    /**
     * 
     * @param {Pointer<Guid>} conceptId 
     * @param {IUnknown} conceptInterface 
     * @param {IKeyStore} conceptMetadata 
     * @returns {HRESULT} 
     */
    SetConcept(conceptId, conceptInterface, conceptMetadata) {
        result := ComCall(28, this, "ptr", conceptId, "ptr", conceptInterface, "ptr", conceptMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearConcepts() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {PWSTR} name 
     * @param {Integer} searchFlags 
     * @returns {IModelObject} 
     */
    GetRawReference(kind, name, searchFlags) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(30, this, "int", kind, "ptr", name, "uint", searchFlags, "ptr*", &_object := 0, "HRESULT")
        return IModelObject(_object)
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Integer} searchFlags 
     * @returns {IRawEnumerator} 
     */
    EnumerateRawReferences(kind, searchFlags) {
        result := ComCall(31, this, "int", kind, "uint", searchFlags, "ptr*", &_enumerator := 0, "HRESULT")
        return IRawEnumerator(_enumerator)
    }

    /**
     * 
     * @param {IModelObject} dataModelObject 
     * @param {IUnknown} _context 
     * @returns {HRESULT} 
     */
    SetContextForDataModel(dataModelObject, _context) {
        result := ComCall(32, this, "ptr", dataModelObject, "ptr", _context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} dataModelObject 
     * @returns {IUnknown} 
     */
    GetContextForDataModel(dataModelObject) {
        result := ComCall(33, this, "ptr", dataModelObject, "ptr*", &_context := 0, "HRESULT")
        return IUnknown(_context)
    }

    /**
     * The CompareAddresses function compares two addresses, indicating that one of the addresses is greater than, less than, or equal to the other address.
     * @remarks
     * An address that is less than another address indicates a previous frame. An address that is greater than another address indicates a later frame.
     * 
     * Network Monitor provides two other functions, [CompareFrameDestAddress](compareframedestaddress.md) and [CompareFrameSourceAddress](compareframesourceaddress.md), which you can use to compare addresses. The **CompareFrameDestAddress** function compares a given address to the frame's destination address, and the **CompareFrameSourceAddress** function compares a given address to the frame's source address.
     * @param {IModelObject} other 
     * @returns {IModelObject} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/compareaddresses
     */
    Compare(other) {
        result := ComCall(34, this, "ptr", other, "ptr*", &ppResult := 0, "HRESULT")
        return IModelObject(ppResult)
    }

    /**
     * 
     * @param {IModelObject} other 
     * @returns {Boolean} 
     */
    IsEqualTo(other) {
        result := ComCall(35, this, "ptr", other, "int*", &equal := 0, "HRESULT")
        return equal
    }
}
