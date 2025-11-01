#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\StructuredStorage\IPropertyBag.ahk

/**
 * Can be used to define custom properties as appropriate.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbpropertyset
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbPropertySet extends IPropertyBag{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbPropertySet
     * @type {Guid}
     */
    static IID => Guid("{5c025171-bb1e-4baf-a212-6d5e9774b33b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
