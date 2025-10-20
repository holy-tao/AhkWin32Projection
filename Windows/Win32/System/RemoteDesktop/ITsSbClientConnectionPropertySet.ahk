#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbPropertySet.ahk

/**
 * Can be used to define custom properties of a client connection as appropriate.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbclientconnectionpropertyset
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbClientConnectionPropertySet extends ITsSbPropertySet{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbClientConnectionPropertySet
     * @type {Guid}
     */
    static IID => Guid("{e51995b0-46d6-11dd-aa21-cedc55d89593}")

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
