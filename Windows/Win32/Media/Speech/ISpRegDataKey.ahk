#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Registry\HKEY.ahk
#Include .\ISpDataKey.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class ISpRegDataKey extends ISpDataKey {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpRegDataKey
     * @type {Guid}
     */
    static IID => Guid("{92a66e2b-c830-4149-83df-6fc2ba1e7a5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetKey"]

    /**
     * 
     * @param {HKEY} _hkey 
     * @param {BOOL} fReadOnly 
     * @returns {HRESULT} 
     */
    SetKey(_hkey, fReadOnly) {
        _hkey := _hkey is Win32Handle ? NumGet(_hkey, "ptr") : _hkey

        result := ComCall(15, this, "ptr", _hkey, "int", fReadOnly, "HRESULT")
        return result
    }
}
