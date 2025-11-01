#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugSymbols2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugSymbols2
     * @type {Guid}
     */
    static IID => Guid("{3a707211-afdd-4495-ad4f-56fecdf8163f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSymbolOptions", "AddSymbolOptions", "RemoveSymbolOptions", "SetSymbolOptions", "GetNameByOffset", "GetOffsetByName", "GetNearNameByOffset", "GetLineByOffset", "GetOffsetByLine", "GetNumberModules", "GetModuleByIndex", "GetModuleByModuleName", "GetModuleByOffset", "GetModuleNames", "GetModuleParameters", "GetSymbolModule", "GetTypeName", "GetTypeId", "GetTypeSize", "GetFieldOffset", "GetSymbolTypeId", "GetOffsetTypeId", "ReadTypedDataVirtual", "WriteTypedDataVirtual", "OutputTypedDataVirtual", "ReadTypedDataPhysical", "WriteTypedDataPhysical", "OutputTypedDataPhysical", "GetScope", "SetScope", "ResetScope", "GetScopeSymbolGroup", "CreateSymbolGroup", "StartSymbolMatch", "GetNextSymbolMatch", "EndSymbolMatch", "Reload", "GetSymbolPath", "SetSymbolPath", "AppendSymbolPath", "GetImagePath", "SetImagePath", "AppendImagePath", "GetSourcePath", "GetSourcePathElement", "SetSourcePath", "AppendSourcePath", "FindSourceFile", "GetSourceFileLineOffsets", "GetModuleVersionInformation", "GetModuleNameString", "GetConstantName", "GetFieldName", "GetTypeOptions", "AddTypeOptions", "RemoveTypeOptions", "SetTypeOptions"]

    /**
     * 
     * @param {Pointer<Integer>} Options 
     * @returns {HRESULT} 
     */
    GetSymbolOptions(Options) {
        result := ComCall(3, this, "uint*", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddSymbolOptions(Options) {
        result := ComCall(4, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveSymbolOptions(Options) {
        result := ComCall(5, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetSymbolOptions(Options) {
        result := ComCall(6, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNameByOffset(Offset, NameBuffer, NameBufferSize, NameSize, Displacement) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(7, this, "uint", Offset, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetOffsetByName(Symbol, Offset) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(8, this, "ptr", Symbol, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Delta 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetNearNameByOffset(Offset, Delta, NameBuffer, NameBufferSize, NameSize, Displacement) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(9, this, "uint", Offset, "int", Delta, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Line 
     * @param {PSTR} FileBuffer 
     * @param {Integer} FileBufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Displacement 
     * @returns {HRESULT} 
     */
    GetLineByOffset(Offset, Line, FileBuffer, FileBufferSize, FileSize, Displacement) {
        FileBuffer := FileBuffer is String ? StrPtr(FileBuffer) : FileBuffer

        result := ComCall(10, this, "uint", Offset, "uint*", Line, "ptr", FileBuffer, "uint", FileBufferSize, "uint*", FileSize, "uint*", Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Line 
     * @param {PSTR} File 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetOffsetByLine(Line, File, Offset) {
        File := File is String ? StrPtr(File) : File

        result := ComCall(11, this, "uint", Line, "ptr", File, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Loaded 
     * @param {Pointer<Integer>} Unloaded 
     * @returns {HRESULT} 
     */
    GetNumberModules(Loaded, Unloaded) {
        result := ComCall(12, this, "uint*", Loaded, "uint*", Unloaded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByIndex(Index, Base) {
        result := ComCall(13, this, "uint", Index, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Integer} StartIndex 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByModuleName(Name, StartIndex, Index, Base) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(14, this, "ptr", Name, "uint", StartIndex, "uint*", Index, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} StartIndex 
     * @param {Pointer<Integer>} Index 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetModuleByOffset(Offset, StartIndex, Index, Base) {
        result := ComCall(15, this, "uint", Offset, "uint", StartIndex, "uint*", Index, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} ImageNameBuffer 
     * @param {Integer} ImageNameBufferSize 
     * @param {Pointer<Integer>} ImageNameSize 
     * @param {PSTR} ModuleNameBuffer 
     * @param {Integer} ModuleNameBufferSize 
     * @param {Pointer<Integer>} ModuleNameSize 
     * @param {PSTR} LoadedImageNameBuffer 
     * @param {Integer} LoadedImageNameBufferSize 
     * @param {Pointer<Integer>} LoadedImageNameSize 
     * @returns {HRESULT} 
     */
    GetModuleNames(Index, Base, ImageNameBuffer, ImageNameBufferSize, ImageNameSize, ModuleNameBuffer, ModuleNameBufferSize, ModuleNameSize, LoadedImageNameBuffer, LoadedImageNameBufferSize, LoadedImageNameSize) {
        ImageNameBuffer := ImageNameBuffer is String ? StrPtr(ImageNameBuffer) : ImageNameBuffer
        ModuleNameBuffer := ModuleNameBuffer is String ? StrPtr(ModuleNameBuffer) : ModuleNameBuffer
        LoadedImageNameBuffer := LoadedImageNameBuffer is String ? StrPtr(LoadedImageNameBuffer) : LoadedImageNameBuffer

        result := ComCall(16, this, "uint", Index, "uint", Base, "ptr", ImageNameBuffer, "uint", ImageNameBufferSize, "uint*", ImageNameSize, "ptr", ModuleNameBuffer, "uint", ModuleNameBufferSize, "uint*", ModuleNameSize, "ptr", LoadedImageNameBuffer, "uint", LoadedImageNameBufferSize, "uint*", LoadedImageNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Bases 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_MODULE_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    GetModuleParameters(Count, Bases, Start, Params) {
        result := ComCall(17, this, "uint", Count, "uint*", Bases, "uint", Start, "ptr", Params, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @param {Pointer<Integer>} Base 
     * @returns {HRESULT} 
     */
    GetSymbolModule(Symbol, Base) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(18, this, "ptr", Symbol, "uint*", Base, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetTypeName(Module, TypeId, NameBuffer, NameBufferSize, NameSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(19, this, "uint", Module, "uint", TypeId, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {PSTR} Name 
     * @param {Pointer<Integer>} TypeId 
     * @returns {HRESULT} 
     */
    GetTypeId(Module, Name, TypeId) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(20, this, "uint", Module, "ptr", Name, "uint*", TypeId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer<Integer>} Size 
     * @returns {HRESULT} 
     */
    GetTypeSize(Module, TypeId, Size) {
        result := ComCall(21, this, "uint", Module, "uint", TypeId, "uint*", Size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PSTR} Field 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetFieldOffset(Module, TypeId, Field, Offset) {
        Field := Field is String ? StrPtr(Field) : Field

        result := ComCall(22, this, "uint", Module, "uint", TypeId, "ptr", Field, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @param {Pointer<Integer>} TypeId 
     * @param {Pointer<Integer>} Module 
     * @returns {HRESULT} 
     */
    GetSymbolTypeId(Symbol, TypeId, Module) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(23, this, "ptr", Symbol, "uint*", TypeId, "uint*", Module, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} TypeId 
     * @param {Pointer<Integer>} Module 
     * @returns {HRESULT} 
     */
    GetOffsetTypeId(Offset, TypeId, Module) {
        result := ComCall(24, this, "uint", Offset, "uint*", TypeId, "uint*", Module, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadTypedDataVirtual(Offset, Module, TypeId, Buffer, BufferSize, BytesRead) {
        result := ComCall(25, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteTypedDataVirtual(Offset, Module, TypeId, Buffer, BufferSize, BytesWritten) {
        result := ComCall(26, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
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
        result := ComCall(27, this, "uint", OutputControl, "uint", Offset, "uint", Module, "uint", TypeId, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadTypedDataPhysical(Offset, Module, TypeId, Buffer, BufferSize, BytesRead) {
        result := ComCall(28, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteTypedDataPhysical(Offset, Module, TypeId, Buffer, BufferSize, BytesWritten) {
        result := ComCall(29, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
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
        result := ComCall(30, this, "uint", OutputControl, "uint", Offset, "uint", Module, "uint", TypeId, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME>} ScopeFrame 
     * @param {Pointer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    GetScope(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        result := ComCall(31, this, "uint*", InstructionOffset, "ptr", ScopeFrame, "ptr", ScopeContext, "uint", ScopeContextSize, "HRESULT")
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
        result := ComCall(32, this, "uint", InstructionOffset, "ptr", ScopeFrame, "ptr", ScopeContext, "uint", ScopeContextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetScope() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {IDebugSymbolGroup} Update 
     * @param {Pointer<IDebugSymbolGroup>} Symbols 
     * @returns {HRESULT} 
     */
    GetScopeSymbolGroup(Flags, Update, Symbols) {
        result := ComCall(34, this, "uint", Flags, "ptr", Update, "ptr*", Symbols, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugSymbolGroup>} Group 
     * @returns {HRESULT} 
     */
    CreateSymbolGroup(Group) {
        result := ComCall(35, this, "ptr*", Group, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Pattern 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    StartSymbolMatch(Pattern, Handle) {
        Pattern := Pattern is String ? StrPtr(Pattern) : Pattern

        result := ComCall(36, this, "ptr", Pattern, "uint*", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} MatchSize 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetNextSymbolMatch(Handle, Buffer, BufferSize, MatchSize, Offset) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(37, this, "uint", Handle, "ptr", Buffer, "uint", BufferSize, "uint*", MatchSize, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    EndSymbolMatch(Handle) {
        result := ComCall(38, this, "uint", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Module 
     * @returns {HRESULT} 
     */
    Reload(Module) {
        Module := Module is String ? StrPtr(Module) : Module

        result := ComCall(39, this, "ptr", Module, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} PathSize 
     * @returns {HRESULT} 
     */
    GetSymbolPath(Buffer, BufferSize, PathSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(40, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @returns {HRESULT} 
     */
    SetSymbolPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(41, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSymbolPath(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(42, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} PathSize 
     * @returns {HRESULT} 
     */
    GetImagePath(Buffer, BufferSize, PathSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(43, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @returns {HRESULT} 
     */
    SetImagePath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(44, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendImagePath(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(45, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} PathSize 
     * @returns {HRESULT} 
     */
    GetSourcePath(Buffer, BufferSize, PathSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(46, this, "ptr", Buffer, "uint", BufferSize, "uint*", PathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} ElementSize 
     * @returns {HRESULT} 
     */
    GetSourcePathElement(Index, Buffer, BufferSize, ElementSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(47, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", ElementSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @returns {HRESULT} 
     */
    SetSourcePath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(48, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Addition 
     * @returns {HRESULT} 
     */
    AppendSourcePath(Addition) {
        Addition := Addition is String ? StrPtr(Addition) : Addition

        result := ComCall(49, this, "ptr", Addition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {PSTR} File 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} FoundElement 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFile(StartElement, File, Flags, FoundElement, Buffer, BufferSize, FoundSize) {
        File := File is String ? StrPtr(File) : File
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(50, this, "uint", StartElement, "ptr", File, "uint", Flags, "uint*", FoundElement, "ptr", Buffer, "uint", BufferSize, "uint*", FoundSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} File 
     * @param {Pointer<Integer>} Buffer 
     * @param {Integer} BufferLines 
     * @param {Pointer<Integer>} FileLines 
     * @returns {HRESULT} 
     */
    GetSourceFileLineOffsets(File, Buffer, BufferLines, FileLines) {
        File := File is String ? StrPtr(File) : File

        result := ComCall(51, this, "ptr", File, "uint*", Buffer, "uint", BufferLines, "uint*", FileLines, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} Item 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} VerInfoSize 
     * @returns {HRESULT} 
     */
    GetModuleVersionInformation(Index, Base, Item, Buffer, BufferSize, VerInfoSize) {
        Item := Item is String ? StrPtr(Item) : Item

        result := ComCall(52, this, "uint", Index, "uint", Base, "ptr", Item, "ptr", Buffer, "uint", BufferSize, "uint*", VerInfoSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetModuleNameString(Which, Index, Base, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(53, this, "uint", Which, "uint", Index, "uint", Base, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Value 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetConstantName(Module, TypeId, Value, NameBuffer, NameBufferSize, NameSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(54, this, "uint", Module, "uint", TypeId, "uint", Value, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} FieldIndex 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetFieldName(Module, TypeId, FieldIndex, NameBuffer, NameBufferSize, NameSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(55, this, "uint", Module, "uint", TypeId, "uint", FieldIndex, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Options 
     * @returns {HRESULT} 
     */
    GetTypeOptions(Options) {
        result := ComCall(56, this, "uint*", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddTypeOptions(Options) {
        result := ComCall(57, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveTypeOptions(Options) {
        result := ComCall(58, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetTypeOptions(Options) {
        result := ComCall(59, this, "uint", Options, "HRESULT")
        return result
    }
}
