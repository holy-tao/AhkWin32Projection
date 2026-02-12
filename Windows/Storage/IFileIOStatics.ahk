#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include Streams\IBuffer.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IFileIOStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileIOStatics
     * @type {Guid}
     */
    static IID => Guid("{887411eb-7f54-4732-a5f0-5e43e3b8c2f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadTextAsync", "ReadTextWithEncodingAsync", "WriteTextAsync", "WriteTextWithEncodingAsync", "AppendTextAsync", "AppendTextWithEncodingAsync", "ReadLinesAsync", "ReadLinesWithEncodingAsync", "WriteLinesAsync", "WriteLinesWithEncodingAsync", "AppendLinesAsync", "AppendLinesWithEncodingAsync", "ReadBufferAsync", "WriteBufferAsync", "WriteBytesAsync"]

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ReadTextAsync(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), textOperation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {Integer} encoding 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ReadTextWithEncodingAsync(file_, encoding) {
        result := ComCall(7, this, "ptr", file_, "int", encoding, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), textOperation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {HSTRING} contents 
     * @returns {IAsyncAction} 
     */
    WriteTextAsync(file_, contents) {
        if(contents is String) {
            pin := HSTRING.Create(contents)
            contents := pin.Value
        }
        contents := contents is Win32Handle ? NumGet(contents, "ptr") : contents

        result := ComCall(8, this, "ptr", file_, "ptr", contents, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(textOperation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {HSTRING} contents 
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     */
    WriteTextWithEncodingAsync(file_, contents, encoding) {
        if(contents is String) {
            pin := HSTRING.Create(contents)
            contents := pin.Value
        }
        contents := contents is Win32Handle ? NumGet(contents, "ptr") : contents

        result := ComCall(9, this, "ptr", file_, "ptr", contents, "int", encoding, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(textOperation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {HSTRING} contents 
     * @returns {IAsyncAction} 
     */
    AppendTextAsync(file_, contents) {
        if(contents is String) {
            pin := HSTRING.Create(contents)
            contents := pin.Value
        }
        contents := contents is Win32Handle ? NumGet(contents, "ptr") : contents

        result := ComCall(10, this, "ptr", file_, "ptr", contents, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(textOperation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {HSTRING} contents 
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     */
    AppendTextWithEncodingAsync(file_, contents, encoding) {
        if(contents is String) {
            pin := HSTRING.Create(contents)
            contents := pin.Value
        }
        contents := contents is Win32Handle ? NumGet(contents, "ptr") : contents

        result := ComCall(11, this, "ptr", file_, "ptr", contents, "int", encoding, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(textOperation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<IVector<HSTRING>>} 
     */
    ReadLinesAsync(file_) {
        result := ComCall(12, this, "ptr", file_, "ptr*", &linesOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), linesOperation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {Integer} encoding 
     * @returns {IAsyncOperation<IVector<HSTRING>>} 
     */
    ReadLinesWithEncodingAsync(file_, encoding) {
        result := ComCall(13, this, "ptr", file_, "int", encoding, "ptr*", &linesOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), linesOperation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {IIterable<HSTRING>} lines 
     * @returns {IAsyncAction} 
     */
    WriteLinesAsync(file_, lines) {
        result := ComCall(14, this, "ptr", file_, "ptr", lines, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {IIterable<HSTRING>} lines 
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     */
    WriteLinesWithEncodingAsync(file_, lines, encoding) {
        result := ComCall(15, this, "ptr", file_, "ptr", lines, "int", encoding, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {IIterable<HSTRING>} lines 
     * @returns {IAsyncAction} 
     */
    AppendLinesAsync(file_, lines) {
        result := ComCall(16, this, "ptr", file_, "ptr", lines, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {IIterable<HSTRING>} lines 
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     */
    AppendLinesWithEncodingAsync(file_, lines, encoding) {
        result := ComCall(17, this, "ptr", file_, "ptr", lines, "int", encoding, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    ReadBufferAsync(file_) {
        result := ComCall(18, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, operation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {IBuffer} buffer_ 
     * @returns {IAsyncAction} 
     */
    WriteBufferAsync(file_, buffer_) {
        result := ComCall(19, this, "ptr", file_, "ptr", buffer_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer 
     * @returns {IAsyncAction} 
     */
    WriteBytesAsync(file_, buffer_length, buffer) {
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, "ptr", file_, "uint", buffer_length, bufferMarshal, buffer, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
