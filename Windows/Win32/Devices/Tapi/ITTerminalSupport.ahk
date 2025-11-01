#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-get_staticterminals
     */
    get_StaticTerminals(pVariant) {
        result := ComCall(7, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTerminal>} ppTerminalEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-enumeratestaticterminals
     */
    EnumerateStaticTerminals(ppTerminalEnumerator) {
        result := ComCall(8, this, "ptr*", ppTerminalEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-get_dynamicterminalclasses
     */
    get_DynamicTerminalClasses(pVariant) {
        result := ComCall(9, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTerminalClass>} ppTerminalClassEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-enumeratedynamicterminalclasses
     */
    EnumerateDynamicTerminalClasses(ppTerminalClassEnumerator) {
        result := ComCall(10, this, "ptr*", ppTerminalClassEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pTerminalClass 
     * @param {Integer} lMediaType 
     * @param {Integer} Direction 
     * @param {Pointer<ITTerminal>} ppTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-createterminal
     */
    CreateTerminal(pTerminalClass, lMediaType, Direction, ppTerminal) {
        pTerminalClass := pTerminalClass is String ? BSTR.Alloc(pTerminalClass).Value : pTerminalClass

        result := ComCall(11, this, "ptr", pTerminalClass, "int", lMediaType, "int", Direction, "ptr*", ppTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @param {Integer} Direction 
     * @param {Pointer<ITTerminal>} ppTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itterminalsupport-getdefaultstaticterminal
     */
    GetDefaultStaticTerminal(lMediaType, Direction, ppTerminal) {
        result := ComCall(12, this, "int", lMediaType, "int", Direction, "ptr*", ppTerminal, "HRESULT")
        return result
    }
}
