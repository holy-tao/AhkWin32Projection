#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumTerminal.ahk
#Include .\IEnumTerminalClass.ahk
#Include .\ITTerminal.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITTerminalSupport interface is exposed on an Address object only if an MSP exists. The methods of this interface allow an application to discover available terminals and/or create one, and get pointers to required Terminal objects.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itterminalsupport
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTerminalSupport extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITTerminalSupport
     * @type {Guid}
     */
    static IID => Guid("{b1efc385-9355-11d0-835c-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StaticTerminals", "EnumerateStaticTerminals", "get_DynamicTerminalClasses", "EnumerateDynamicTerminalClasses", "CreateTerminal", "GetDefaultStaticTerminal"]

    /**
     * @type {VARIANT} 
     */
    StaticTerminals {
        get => this.get_StaticTerminals()
    }

    /**
     * @type {VARIANT} 
     */
    DynamicTerminalClasses {
        get => this.get_DynamicTerminalClasses()
    }

    /**
     * The get_StaticTerminals method creates a collection of currently available static terminals.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b>, which TAPI will fill in with an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminalsupport-get_staticterminals
     */
    get_StaticTerminals() {
        pVariant := VARIANT()
        result := ComCall(7, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateStaticTerminals method enumerates the currently available static terminals associated with the address.
     * @returns {IEnumTerminal} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminalsupport-enumeratestaticterminals
     */
    EnumerateStaticTerminals() {
        result := ComCall(8, this, "ptr*", &ppTerminalEnumerator := 0, "HRESULT")
        return IEnumTerminal(ppTerminalEnumerator)
    }

    /**
     * The get_DynamicTerminalClasses method creates a collection of currently available dynamic terminals.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/terminal-class">terminal classes</a> in a string (<b>BSTR</b>) format.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminalsupport-get_dynamicterminalclasses
     */
    get_DynamicTerminalClasses() {
        pVariant := VARIANT()
        result := ComCall(9, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateDynamicTerminalClasses method enumerates the currently available dynamic terminal classes that are supported.
     * @returns {IEnumTerminalClass} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminalclass">IEnumTerminalClass</a> enumerator. TAPI returns these classes as GUIDs.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminalsupport-enumeratedynamicterminalclasses
     */
    EnumerateDynamicTerminalClasses() {
        result := ComCall(10, this, "ptr*", &ppTerminalClassEnumerator := 0, "HRESULT")
        return IEnumTerminalClass(ppTerminalClassEnumerator)
    }

    /**
     * The CreateTerminal method creates and initializes a new ITTerminal object based on the dynamic terminal class and media. The terminal class is identified by a GUID. The GUID must be converted to a string using StringFromIID to pass to this method.
     * @param {BSTR} pTerminalClass Pointer to <b>BSTR</b> containing the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/terminal-class">terminal class</a> (GUID) for the new terminal object.
     * @param {Integer} lMediaType Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a> for the new terminal object.
     * @param {Integer} Direction <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor of the terminal direction.
     * @returns {ITTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> object created.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminalsupport-createterminal
     */
    CreateTerminal(pTerminalClass, lMediaType, Direction) {
        pTerminalClass := pTerminalClass is String ? BSTR.Alloc(pTerminalClass).Value : pTerminalClass

        result := ComCall(11, this, "ptr", pTerminalClass, "int", lMediaType, "int", Direction, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * The GetDefaultStaticTerminal method gets the default static terminal for the media type specified.
     * @param {Integer} lMediaType <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">Media type</a> of the required terminal.
     * @param {Integer} Direction <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor of the terminal direction.
     * @returns {ITTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface. <b>NULL</b> if no terminal is available.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itterminalsupport-getdefaultstaticterminal
     */
    GetDefaultStaticTerminal(lMediaType, Direction) {
        result := ComCall(12, this, "int", lMediaType, "int", Direction, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }
}
