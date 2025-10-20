#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbPropertySet.ahk

/**
 * Derive from this interface to define a custom target property set.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbtargetpropertyset
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbTargetPropertySet extends ITsSbPropertySet{
    /**
     * The interface identifier for ITsSbTargetPropertySet
     * @type {Guid}
     */
    static IID => Guid("{f7bda5d6-994c-4e11-a079-2763b61830ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5
}
