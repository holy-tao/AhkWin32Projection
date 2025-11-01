#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbPropertySet.ahk

/**
 * Can be used to define custom plug-in properties as appropriate.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbpluginpropertyset
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbPluginPropertySet extends ITsSbPropertySet{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbPluginPropertySet
     * @type {Guid}
     */
    static IID => Guid("{95006e34-7eff-4b6c-bb40-49a4fda7cea6}")

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
