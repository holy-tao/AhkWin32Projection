#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugSymbols extends IUnknown{
    /**
     * The interface identifier for IDebugSymbols
     * @type {Guid}
     */
    static IID => Guid("{8c31e98c-983a-48a5-9016-6fe5d667a950}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} Options 
     * @returns {HRESULT} 
     */
    GetSymbolOptions(Options) {
        result := ComCall(3, this, "uint*", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddSymbolOptions(Options) {
        result := ComCall(4, this, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveSymbolOptions(Options) {
        result := ComCall(5, this, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetSymbolOptions(Options) {
        result := ComCall(6, this, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @param {Pointer<UInt64>} Displacement 
     * @returns {HRESULT} 
     */
    GetNameByOffset(Offset, NameBuffer, NameBufferSize, NameSize, Displacement) {
        result := ComCall(7, this, "uint", Offset, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", Displacement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetOffsetByName(Symbol, Offset) {
        result := ComCall(8, this, "ptr", Symbol, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Delta 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @param {Pointer<UInt64>} Displacement 
     * @returns {HRESULT} 
     */
    GetNearNameByOffset(Offset, Delta, NameBuffer, NameBufferSize, NameSize, Displacement) {
        result := ComCall(9, this, "uint", Offset, "int", Delta, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", Displacement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<UInt32>} Line 
     * @param {PSTR} FileBuffer 
     * @param {Integer} FileBufferSize 
     * @param {Pointer<UInt32>} FileSize 
     * @param {Pointer<UInt64>} Displacement 
     * @returns {HRESULT} 
     */
    GetLineByOffset(Offset, Line, FileBuffer, FileBufferSize, FileSize, Displacement) {
        result := ComCall(10, this, "uint", Offset, "uint*", Line, "ptr", FileBuffer, "uint", FileBufferSize, "uint*", FileSize, "uint*", Displacement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Line 
     * @param {PSTR} File 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetOffsetByLine(Line, File, Offset) {
        result := ComCall(11, this, "uint", Line, "ptr", File, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Loaded 
     * @param {Pointer<UInt32>} Unloaded 
     * @returns {HRESULT} 
     */
    GetNumberModules(Loaded, Unloaded) {
        result := ComCall(12, this, "uint*", Loaded, "uint*", Unloaded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<UInt64>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByIndex(Index, Base) {
        result := ComCall(13, this, "uint", Index, "uint*", Base, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Integer} StartIndex 
     * @param {Pointer<UInt32>} Index 
     * @param {Pointer<UInt64>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByModuleName(Name, StartIndex, Index, Base) {
        result := ComCall(14, this, "ptr", Name, "uint", StartIndex, "uint*", Index, "uint*", Base, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} StartIndex 
     * @param {Pointer<UInt32>} Index 
     * @param {Pointer<UInt64>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByOffset(Offset, StartIndex, Index, Base) {
        result := ComCall(15, this, "uint", Offset, "uint", StartIndex, "uint*", Index, "uint*", Base, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} ImageNameBuffer 
     * @param {Integer} ImageNameBufferSize 
     * @param {Pointer<UInt32>} ImageNameSize 
     * @param {PSTR} ModuleNameBuffer 
     * @param {Integer} ModuleNameBufferSize 
     * @param {Pointer<UInt32>} ModuleNameSize 
     * @param {PSTR} LoadedImageNameBuffer 
     * @param {Integer} LoadedImageNameBufferSize 
     * @param {Pointer<UInt32>} LoadedImageNameSize 
     * @returns {HRESULT} 
     */
    GetModuleNames(Index, Base, ImageNameBuffer, ImageNameBufferSize, ImageNameSize, ModuleNameBuffer, ModuleNameBufferSize, ModuleNameSize, LoadedImageNameBuffer, LoadedImageNameBufferSize, LoadedImageNameSize) {
        result := ComCall(16, this, "uint", Index, "uint", Base, "ptr", ImageNameBuffer, "uint", ImageNameBufferSize, "uint*", ImageNameSize, "ptr", ModuleNameBuffer, "uint", ModuleNameBufferSize, "uint*", ModuleNameSize, "ptr", LoadedImageNameBuffer, "uint", LoadedImageNameBufferSize, "uint*", LoadedImageNameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<UInt64>} Bases 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_MODULE_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    GetModuleParameters(Count, Bases, Start, Params) {
        result := ComCall(17, this, "uint", Count, "uint*", Bases, "uint", Start, "ptr", Params, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @param {Pointer<UInt64>} Base 
     * @returns {HRESULT} 
     */
    GetSymbolModule(Symbol, Base) {
        result := ComCall(18, this, "ptr", Symbol, "uint*", Base, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @returns {HRESULT} 
     */
    GetTypeName(Module, TypeId, NameBuffer, NameBufferSize, NameSize) {
        result := ComCall(19, this, "uint", Module, "uint", TypeId, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {PSTR} Name 
     * @param {Pointer<UInt32>} TypeId 
     * @returns {HRESULT} 
     */
    GetTypeId(Module, Name, TypeId) {
        result := ComCall(20, this, "uint", Module, "ptr", Name, "uint*", TypeId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer<UInt32>} Size 
     * @returns {HRESULT} 
     */
    GetTypeSize(Module, TypeId, Size) {
        result := ComCall(21, this, "uint", Module, "uint", TypeId, "uint*", Size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PSTR} Field 
     * @param {Pointer<UInt32>} Offset 
     * @returns {HRESULT} 
     */
    GetFieldOffset(Module, TypeId, Field, Offset) {
        result := ComCall(22, this, "uint", Module, "uint", TypeId, "ptr", Field, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @param {Pointer<UInt32>} TypeId 
     * @param {Pointer<UInt64>} Module 
     * @returns {HRESULT} 
     */
    GetSymbolTypeId(Symbol, TypeId, Module) {
        result := ComCall(23, this, "ptr", Symbol, "uint*", TypeId, "uint*", Module, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<UInt32>} TypeId 
     * @param {Pointer<UInt64>} Module 
     * @returns {HRESULT} 
     */
    GetOffsetTypeId(Offset, TypeId, Module) {
        result := ComCall(24, this, "uint", Offset, "uint*", TypeId, "uint*", Module, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadTypedDataVirtual(Offset, Module, TypeId, Buffer, BufferSize, BytesRead) {
        result := ComCall(25, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteTypedDataVirtual(Offset, Module, TypeId, Buffer, BufferSize, BytesWritten) {
        result := ComCall(26, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputTypedDataVirtual(OutputControl, Offset, Module, TypeId, Flags) {
        result := ComCall(27, this, "uint", OutputControl, "uint", Offset, "uint", Module, "uint", TypeId, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadTypedDataPhysical(Offset, Module, TypeId, Buffer, BufferSize, BytesRead) {
        result := ComCall(28, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteTypedDataPhysical(Offset, Module, TypeId, Buffer, BufferSize, BytesWritten) {
        result := ComCall(29, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputTypedDataPhysical(OutputControl, Offset, Module, TypeId, Flags) {
        result := ComCall(30, this, "uint", OutputControl, "uint", Offset, "uint", Module, "uint", TypeId, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME>} ScopeFrame 
     * @param {Pointer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    GetScope(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        result := ComCall(31, this, "uint*", InstructionOffset, "ptr", ScopeFrame, "ptr", ScopeContext, "uint", ScopeContextSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME>} ScopeFrame 
     * @param {Pointer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    SetScope(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        result := ComCall(32, this, "uint", InstructionOffset, "ptr", ScopeFrame, "ptr", ScopeContext, "uint", ScopeContextSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetScope() {
        result := ComCall(33, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<IDebugSymbolGroup>} Update 
     * @param {Pointer<IDebugSymbolGroup>} Symbols 
     * @returns {HRESULT} 
     */
    GetScopeSymbolGroup(Flags, Update, Symbols) {
        result := ComCall(34, this, "uint", Flags, "ptr", Update, "ptr", Symbols, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugSymbolGroup>} Group 
     * @returns {HRESULT} 
     */
    CreateSymbolGroup(Group) {
        result := ComCall(35, this, "ptr", Group, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Pattern 
     * @param {Pointer<UInt64>} Handle 
     * @returns {HRESULT} 
     */
    StartSymbolMatch(Pattern, Handle) {
        result := ComCall(36, this, "ptr", Pattern, "uint*", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} MatchSize 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetNextSymbolMatch(Handle, Buffer, BufferSize, MatchSize, Offset) {
        result := ComCall(37, this, "uint", Handle, "ptr", Buffer, "uint", BufferSize, "uint*", MatchSize, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    EndSymbolMatch(Handle) {
        result := ComCall(38, this, "uint", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Module 
     * @returns {HRESULT} 
     */
    Reload(Module) {
        result := ComCall(39, this, "ptr", Module, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} PathSize 
     * @returns {HRESULT} 
     */
    GetSymbolPath(Buffer, BufferSize, PathSize) {
        result := ComCall(40, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @returns {HRESULT} 
     */
    SetSymbolPath(Path) {
        result := ComCall(41, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSymbolPath(Addition) {
        result := ComCall(42, this, "ptr", Addition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} PathSize 
     * @returns {HRESULT} 
     */
    GetImagePath(Buffer, BufferSize, PathSize) {
        result := ComCall(43, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @returns {HRESULT} 
     */
    SetImagePath(Path) {
        result := ComCall(44, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendImagePath(Addition) {
        result := ComCall(45, this, "ptr", Addition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} PathSize 
     * @returns {HRESULT} 
     */
    GetSourcePath(Buffer, BufferSize, PathSize) {
        result := ComCall(46, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} ElementSize 
     * @returns {HRESULT} 
     */
    GetSourcePathElement(Index, Buffer, BufferSize, ElementSize) {
        result := ComCall(47, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", ElementSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @returns {HRESULT} 
     */
    SetSourcePath(Path) {
        result := ComCall(48, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSourcePath(Addition) {
        result := ComCall(49, this, "ptr", Addition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {PSTR} File 
     * @param {Integer} Flags 
     * @param {Pointer<UInt32>} FoundElement 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFile(StartElement, File, Flags, FoundElement, Buffer, BufferSize, FoundSize) {
        result := ComCall(50, this, "uint", StartElement, "ptr", File, "uint", Flags, "uint*", FoundElement, "ptr", Buffer, "uint", BufferSize, "uint*", FoundSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} File 
     * @param {Pointer<UInt64>} Buffer 
     * @param {Integer} BufferLines 
     * @param {Pointer<UInt32>} FileLines 
     * @returns {HRESULT} 
     */
    GetSourceFileLineOffsets(File, Buffer, BufferLines, FileLines) {
        result := ComCall(51, this, "ptr", File, "uint*", Buffer, "uint", BufferLines, "uint*", FileLines, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
