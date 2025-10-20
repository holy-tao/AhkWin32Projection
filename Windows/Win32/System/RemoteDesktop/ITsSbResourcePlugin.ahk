#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbPlugin.ahk

/**
 * Exposes methods that extend the capabilities of Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbresourceplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbResourcePlugin extends ITsSbPlugin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbResourcePlugin
     * @type {Guid}
     */
    static IID => Guid("{ea8db42c-98ed-4535-a88b-2a164f35490f}")

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
