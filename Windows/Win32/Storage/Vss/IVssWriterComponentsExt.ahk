#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssWriterComponentsExt interface is a C++ (not COM) interface used by requesters to access and modify the components of a writer involved in a backup.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nl-vsbackup-ivsswritercomponentsext
 * @namespace Windows.Win32.Storage.Vss
 */
class IVssWriterComponentsExt extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
