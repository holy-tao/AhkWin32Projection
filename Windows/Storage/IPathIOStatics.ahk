#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include Streams\IBuffer.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IPathIOStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPathIOStatics
     * @type {Guid}
     */
    static IID => Guid("{0f2f3758-8ec7-4381-922b-8f6c07d288f3}")

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
     * @param {HSTRING} absolutePath 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ReadTextAsync(absolutePath) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        result := ComCall(6, this, "ptr", absolutePath, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), textOperation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {Integer} encoding 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    ReadTextWithEncodingAsync(absolutePath, encoding) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        result := ComCall(7, this, "ptr", absolutePath, "int", encoding, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), textOperation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {HSTRING} contents 
     * @returns {IAsyncAction} 
     */
    WriteTextAsync(absolutePath, contents) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath
        if(contents is String) {
            pin := HSTRING.Create(contents)
            contents := pin.Value
        }
        contents := contents is Win32Handle ? NumGet(contents, "ptr") : contents

        result := ComCall(8, this, "ptr", absolutePath, "ptr", contents, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(textOperation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {HSTRING} contents 
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     */
    WriteTextWithEncodingAsync(absolutePath, contents, encoding) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath
        if(contents is String) {
            pin := HSTRING.Create(contents)
            contents := pin.Value
        }
        contents := contents is Win32Handle ? NumGet(contents, "ptr") : contents

        result := ComCall(9, this, "ptr", absolutePath, "ptr", contents, "int", encoding, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(textOperation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {HSTRING} contents 
     * @returns {IAsyncAction} 
     */
    AppendTextAsync(absolutePath, contents) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath
        if(contents is String) {
            pin := HSTRING.Create(contents)
            contents := pin.Value
        }
        contents := contents is Win32Handle ? NumGet(contents, "ptr") : contents

        result := ComCall(10, this, "ptr", absolutePath, "ptr", contents, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(textOperation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {HSTRING} contents 
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     */
    AppendTextWithEncodingAsync(absolutePath, contents, encoding) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath
        if(contents is String) {
            pin := HSTRING.Create(contents)
            contents := pin.Value
        }
        contents := contents is Win32Handle ? NumGet(contents, "ptr") : contents

        result := ComCall(11, this, "ptr", absolutePath, "ptr", contents, "int", encoding, "ptr*", &textOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(textOperation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @returns {IAsyncOperation<IVector<HSTRING>>} 
     */
    ReadLinesAsync(absolutePath) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        result := ComCall(12, this, "ptr", absolutePath, "ptr*", &linesOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), linesOperation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {Integer} encoding 
     * @returns {IAsyncOperation<IVector<HSTRING>>} 
     */
    ReadLinesWithEncodingAsync(absolutePath, encoding) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        result := ComCall(13, this, "ptr", absolutePath, "int", encoding, "ptr*", &linesOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), linesOperation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {IIterable<HSTRING>} lines 
     * @returns {IAsyncAction} 
     */
    WriteLinesAsync(absolutePath, lines) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        result := ComCall(14, this, "ptr", absolutePath, "ptr", lines, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {IIterable<HSTRING>} lines 
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     */
    WriteLinesWithEncodingAsync(absolutePath, lines, encoding) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        result := ComCall(15, this, "ptr", absolutePath, "ptr", lines, "int", encoding, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {IIterable<HSTRING>} lines 
     * @returns {IAsyncAction} 
     */
    AppendLinesAsync(absolutePath, lines) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        result := ComCall(16, this, "ptr", absolutePath, "ptr", lines, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {IIterable<HSTRING>} lines 
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     */
    AppendLinesWithEncodingAsync(absolutePath, lines, encoding) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        result := ComCall(17, this, "ptr", absolutePath, "ptr", lines, "int", encoding, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    ReadBufferAsync(absolutePath) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        result := ComCall(18, this, "ptr", absolutePath, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, operation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {IBuffer} buffer_ 
     * @returns {IAsyncAction} 
     */
    WriteBufferAsync(absolutePath, buffer_) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        result := ComCall(19, this, "ptr", absolutePath, "ptr", buffer_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} absolutePath 
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer 
     * @returns {IAsyncAction} 
     */
    WriteBytesAsync(absolutePath, buffer_length, buffer) {
        if(absolutePath is String) {
            pin := HSTRING.Create(absolutePath)
            absolutePath := pin.Value
        }
        absolutePath := absolutePath is Win32Handle ? NumGet(absolutePath, "ptr") : absolutePath

        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, "ptr", absolutePath, "uint", buffer_length, bufferMarshal, buffer, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
