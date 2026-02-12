#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class PDIRTY_PAGE_ROUTINE extends IUnknown {

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
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} OldestLsn 
     * @param {Pointer<Integer>} NewestLsn 
     * @param {Pointer<Void>} Context1 
     * @param {Pointer<Void>} Context2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FileObject, FileOffset, Length, OldestLsn, NewestLsn, Context1, Context2) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        OldestLsnMarshal := OldestLsn is VarRef ? "int64*" : "ptr"
        NewestLsnMarshal := NewestLsn is VarRef ? "int64*" : "ptr"
        Context1Marshal := Context1 is VarRef ? "ptr" : "ptr"
        Context2Marshal := Context2 is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, OldestLsnMarshal, OldestLsn, NewestLsnMarshal, NewestLsn, Context1Marshal, Context1, Context2Marshal, Context2)
    }
}
