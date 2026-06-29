#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_STACK_FRAME.ahk" { DEBUG_STACK_FRAME }
#Import ".\IDebugSymbolGroup.ahk" { IDebugSymbolGroup }
#Import ".\DEBUG_MODULE_PARAMETERS.ahk" { DEBUG_MODULE_PARAMETERS }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugSymbols2 extends IUnknown {
    /**
     * The interface identifier for IDebugSymbols2
     * @type {Guid}
     */
    static IID := Guid("{3a707211-afdd-4495-ad4f-56fecdf8163f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugSymbols2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSymbolOptions            : IntPtr
        AddSymbolOptions            : IntPtr
        RemoveSymbolOptions         : IntPtr
        SetSymbolOptions            : IntPtr
        GetNameByOffset             : IntPtr
        GetOffsetByName             : IntPtr
        GetNearNameByOffset         : IntPtr
        GetLineByOffset             : IntPtr
        GetOffsetByLine             : IntPtr
        GetNumberModules            : IntPtr
        GetModuleByIndex            : IntPtr
        GetModuleByModuleName       : IntPtr
        GetModuleByOffset           : IntPtr
        GetModuleNames              : IntPtr
        GetModuleParameters         : IntPtr
        GetSymbolModule             : IntPtr
        GetTypeName                 : IntPtr
        GetTypeId                   : IntPtr
        GetTypeSize                 : IntPtr
        GetFieldOffset              : IntPtr
        GetSymbolTypeId             : IntPtr
        GetOffsetTypeId             : IntPtr
        ReadTypedDataVirtual        : IntPtr
        WriteTypedDataVirtual       : IntPtr
        OutputTypedDataVirtual      : IntPtr
        ReadTypedDataPhysical       : IntPtr
        WriteTypedDataPhysical      : IntPtr
        OutputTypedDataPhysical     : IntPtr
        GetScope                    : IntPtr
        SetScope                    : IntPtr
        ResetScope                  : IntPtr
        GetScopeSymbolGroup         : IntPtr
        CreateSymbolGroup           : IntPtr
        StartSymbolMatch            : IntPtr
        GetNextSymbolMatch          : IntPtr
        EndSymbolMatch              : IntPtr
        Reload                      : IntPtr
        GetSymbolPath               : IntPtr
        SetSymbolPath               : IntPtr
        AppendSymbolPath            : IntPtr
        GetImagePath                : IntPtr
        SetImagePath                : IntPtr
        AppendImagePath             : IntPtr
        GetSourcePath               : IntPtr
        GetSourcePathElement        : IntPtr
        SetSourcePath               : IntPtr
        AppendSourcePath            : IntPtr
        FindSourceFile              : IntPtr
        GetSourceFileLineOffsets    : IntPtr
        GetModuleVersionInformation : IntPtr
        GetModuleNameString         : IntPtr
        GetConstantName             : IntPtr
        GetFieldName                : IntPtr
        GetTypeOptions              : IntPtr
        AddTypeOptions              : IntPtr
        RemoveTypeOptions           : IntPtr
        SetTypeOptions              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugSymbols2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSymbolOptions() {
        result := ComCall(3, this, "uint*", &Options := 0, "HRESULT")
        return Options
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

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", Offset, "ptr", NameBuffer, "uint", NameBufferSize, NameSizeMarshal, NameSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @returns {Integer} 
     */
    GetOffsetByName(Symbol) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(8, this, "ptr", Symbol, "uint*", &Offset := 0, "HRESULT")
        return Offset
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

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", Offset, "int", Delta, "ptr", NameBuffer, "uint", NameBufferSize, NameSizeMarshal, NameSize, DisplacementMarshal, Displacement, "HRESULT")
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

        LineMarshal := Line is VarRef ? "uint*" : "ptr"
        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        DisplacementMarshal := Displacement is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "uint", Offset, LineMarshal, Line, "ptr", FileBuffer, "uint", FileBufferSize, FileSizeMarshal, FileSize, DisplacementMarshal, Displacement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Line 
     * @param {PSTR} _File 
     * @returns {Integer} 
     */
    GetOffsetByLine(Line, _File) {
        _File := _File is String ? StrPtr(_File) : _File

        result := ComCall(11, this, "uint", Line, "ptr", _File, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Pointer<Integer>} Loaded 
     * @param {Pointer<Integer>} Unloaded 
     * @returns {HRESULT} 
     */
    GetNumberModules(Loaded, Unloaded) {
        LoadedMarshal := Loaded is VarRef ? "uint*" : "ptr"
        UnloadedMarshal := Unloaded is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, LoadedMarshal, Loaded, UnloadedMarshal, Unloaded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Integer} 
     */
    GetModuleByIndex(Index) {
        result := ComCall(13, this, "uint", Index, "uint*", &Base := 0, "HRESULT")
        return Base
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

        IndexMarshal := Index is VarRef ? "uint*" : "ptr"
        BaseMarshal := Base is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", Name, "uint", StartIndex, IndexMarshal, Index, BaseMarshal, Base, "HRESULT")
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
        IndexMarshal := Index is VarRef ? "uint*" : "ptr"
        BaseMarshal := Base is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", Offset, "uint", StartIndex, IndexMarshal, Index, BaseMarshal, Base, "HRESULT")
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

        ImageNameSizeMarshal := ImageNameSize is VarRef ? "uint*" : "ptr"
        ModuleNameSizeMarshal := ModuleNameSize is VarRef ? "uint*" : "ptr"
        LoadedImageNameSizeMarshal := LoadedImageNameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", Index, "uint", Base, "ptr", ImageNameBuffer, "uint", ImageNameBufferSize, ImageNameSizeMarshal, ImageNameSize, "ptr", ModuleNameBuffer, "uint", ModuleNameBufferSize, ModuleNameSizeMarshal, ModuleNameSize, "ptr", LoadedImageNameBuffer, "uint", LoadedImageNameBufferSize, LoadedImageNameSizeMarshal, LoadedImageNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Bases 
     * @param {Integer} Start 
     * @returns {DEBUG_MODULE_PARAMETERS} 
     */
    GetModuleParameters(Count, Bases, Start) {
        BasesMarshal := Bases is VarRef ? "uint*" : "ptr"

        Params := DEBUG_MODULE_PARAMETERS()
        result := ComCall(17, this, "uint", Count, BasesMarshal, Bases, "uint", Start, DEBUG_MODULE_PARAMETERS.Ptr, Params, "HRESULT")
        return Params
    }

    /**
     * 
     * @param {PSTR} Symbol 
     * @returns {Integer} 
     */
    GetSymbolModule(Symbol) {
        Symbol := Symbol is String ? StrPtr(Symbol) : Symbol

        result := ComCall(18, this, "ptr", Symbol, "uint*", &Base := 0, "HRESULT")
        return Base
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @returns {Integer} 
     */
    GetTypeName(Module, TypeId, NameBuffer, NameBufferSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(19, this, "uint", Module, "uint", TypeId, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {PSTR} Name 
     * @returns {Integer} 
     */
    GetTypeId(Module, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(20, this, "uint", Module, "ptr", Name, "uint*", &TypeId := 0, "HRESULT")
        return TypeId
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @returns {Integer} 
     */
    GetTypeSize(Module, TypeId) {
        result := ComCall(21, this, "uint", Module, "uint", TypeId, "uint*", &_Size := 0, "HRESULT")
        return _Size
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {PSTR} Field 
     * @returns {Integer} 
     */
    GetFieldOffset(Module, TypeId, Field) {
        Field := Field is String ? StrPtr(Field) : Field

        result := ComCall(22, this, "uint", Module, "uint", TypeId, "ptr", Field, "uint*", &Offset := 0, "HRESULT")
        return Offset
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

        TypeIdMarshal := TypeId is VarRef ? "uint*" : "ptr"
        ModuleMarshal := Module is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "ptr", Symbol, TypeIdMarshal, TypeId, ModuleMarshal, Module, "HRESULT")
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
        TypeIdMarshal := TypeId is VarRef ? "uint*" : "ptr"
        ModuleMarshal := Module is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "uint", Offset, TypeIdMarshal, TypeId, ModuleMarshal, Module, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadTypedDataVirtual(Offset, Module, TypeId, _Buffer, BufferSize) {
        result := ComCall(25, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteTypedDataVirtual(Offset, Module, TypeId, _Buffer, BufferSize) {
        result := ComCall(26, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
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
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadTypedDataPhysical(Offset, Module, TypeId, _Buffer, BufferSize) {
        result := ComCall(28, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteTypedDataPhysical(Offset, Module, TypeId, _Buffer, BufferSize) {
        result := ComCall(29, this, "uint", Offset, "uint", Module, "uint", TypeId, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
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
     * @param {Integer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    GetScope(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        InstructionOffsetMarshal := InstructionOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, InstructionOffsetMarshal, InstructionOffset, DEBUG_STACK_FRAME.Ptr, ScopeFrame, "ptr", ScopeContext, "uint", ScopeContextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME>} ScopeFrame 
     * @param {Integer} ScopeContext 
     * @param {Integer} ScopeContextSize 
     * @returns {HRESULT} 
     */
    SetScope(InstructionOffset, ScopeFrame, ScopeContext, ScopeContextSize) {
        result := ComCall(32, this, "uint", InstructionOffset, DEBUG_STACK_FRAME.Ptr, ScopeFrame, "ptr", ScopeContext, "uint", ScopeContextSize, "HRESULT")
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
     * @returns {IDebugSymbolGroup} 
     */
    GetScopeSymbolGroup(Flags, Update) {
        result := ComCall(34, this, "uint", Flags, "ptr", Update, "ptr*", &Symbols := 0, "HRESULT")
        return IDebugSymbolGroup(Symbols)
    }

    /**
     * 
     * @returns {IDebugSymbolGroup} 
     */
    CreateSymbolGroup() {
        result := ComCall(35, this, "ptr*", &Group := 0, "HRESULT")
        return IDebugSymbolGroup(Group)
    }

    /**
     * 
     * @param {PSTR} Pattern 
     * @returns {Integer} 
     */
    StartSymbolMatch(Pattern) {
        Pattern := Pattern is String ? StrPtr(Pattern) : Pattern

        result := ComCall(36, this, "ptr", Pattern, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} MatchSize 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetNextSymbolMatch(_Handle, _Buffer, BufferSize, MatchSize, Offset) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        MatchSizeMarshal := MatchSize is VarRef ? "uint*" : "ptr"
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(37, this, "uint", _Handle, "ptr", _Buffer, "uint", BufferSize, MatchSizeMarshal, MatchSize, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @returns {HRESULT} 
     */
    EndSymbolMatch(_Handle) {
        result := ComCall(38, this, "uint", _Handle, "HRESULT")
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
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolPath(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(40, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &PathSize := 0, "HRESULT")
        return PathSize
    }

    /**
     * 
     * @param {PSTR} _Path 
     * @returns {HRESULT} 
     */
    SetSymbolPath(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(41, this, "ptr", _Path, "HRESULT")
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
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetImagePath(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(43, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &PathSize := 0, "HRESULT")
        return PathSize
    }

    /**
     * 
     * @param {PSTR} _Path 
     * @returns {HRESULT} 
     */
    SetImagePath(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(44, this, "ptr", _Path, "HRESULT")
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
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourcePath(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(46, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &PathSize := 0, "HRESULT")
        return PathSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSourcePathElement(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(47, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &ElementSize := 0, "HRESULT")
        return ElementSize
    }

    /**
     * 
     * @param {PSTR} _Path 
     * @returns {HRESULT} 
     */
    SetSourcePath(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(48, this, "ptr", _Path, "HRESULT")
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
     * @param {PSTR} _File 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} FoundElement 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FoundSize 
     * @returns {HRESULT} 
     */
    FindSourceFile(StartElement, _File, Flags, FoundElement, _Buffer, BufferSize, FoundSize) {
        _File := _File is String ? StrPtr(_File) : _File
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        FoundElementMarshal := FoundElement is VarRef ? "uint*" : "ptr"
        FoundSizeMarshal := FoundSize is VarRef ? "uint*" : "ptr"

        result := ComCall(50, this, "uint", StartElement, "ptr", _File, "uint", Flags, FoundElementMarshal, FoundElement, "ptr", _Buffer, "uint", BufferSize, FoundSizeMarshal, FoundSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} _File 
     * @param {Pointer<Integer>} _Buffer 
     * @param {Integer} BufferLines 
     * @param {Pointer<Integer>} FileLines 
     * @returns {HRESULT} 
     */
    GetSourceFileLineOffsets(_File, _Buffer, BufferLines, FileLines) {
        _File := _File is String ? StrPtr(_File) : _File

        _BufferMarshal := _Buffer is VarRef ? "uint*" : "ptr"
        FileLinesMarshal := FileLines is VarRef ? "uint*" : "ptr"

        result := ComCall(51, this, "ptr", _File, _BufferMarshal, _Buffer, "uint", BufferLines, FileLinesMarshal, FileLines, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} Item 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetModuleVersionInformation(Index, Base, Item, _Buffer, BufferSize) {
        Item := Item is String ? StrPtr(Item) : Item

        result := ComCall(52, this, "uint", Index, "uint", Base, "ptr", Item, "ptr", _Buffer, "uint", BufferSize, "uint*", &VerInfoSize := 0, "HRESULT")
        return VerInfoSize
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Index 
     * @param {Integer} Base 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetModuleNameString(Which, Index, Base, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(53, this, "uint", Which, "uint", Index, "uint", Base, "ptr", _Buffer, "uint", BufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} Value 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @returns {Integer} 
     */
    GetConstantName(Module, TypeId, Value, NameBuffer, NameBufferSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(54, this, "uint", Module, "uint", TypeId, "uint", Value, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * 
     * @param {Integer} Module 
     * @param {Integer} TypeId 
     * @param {Integer} FieldIndex 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @returns {Integer} 
     */
    GetFieldName(Module, TypeId, FieldIndex, NameBuffer, NameBufferSize) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(55, this, "uint", Module, "uint", TypeId, "uint", FieldIndex, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTypeOptions() {
        result := ComCall(56, this, "uint*", &Options := 0, "HRESULT")
        return Options
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

    Query(iid) {
        if (IDebugSymbols2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSymbolOptions := CallbackCreate(GetMethod(implObj, "GetSymbolOptions"), flags, 2)
        this.vtbl.AddSymbolOptions := CallbackCreate(GetMethod(implObj, "AddSymbolOptions"), flags, 2)
        this.vtbl.RemoveSymbolOptions := CallbackCreate(GetMethod(implObj, "RemoveSymbolOptions"), flags, 2)
        this.vtbl.SetSymbolOptions := CallbackCreate(GetMethod(implObj, "SetSymbolOptions"), flags, 2)
        this.vtbl.GetNameByOffset := CallbackCreate(GetMethod(implObj, "GetNameByOffset"), flags, 6)
        this.vtbl.GetOffsetByName := CallbackCreate(GetMethod(implObj, "GetOffsetByName"), flags, 3)
        this.vtbl.GetNearNameByOffset := CallbackCreate(GetMethod(implObj, "GetNearNameByOffset"), flags, 7)
        this.vtbl.GetLineByOffset := CallbackCreate(GetMethod(implObj, "GetLineByOffset"), flags, 7)
        this.vtbl.GetOffsetByLine := CallbackCreate(GetMethod(implObj, "GetOffsetByLine"), flags, 4)
        this.vtbl.GetNumberModules := CallbackCreate(GetMethod(implObj, "GetNumberModules"), flags, 3)
        this.vtbl.GetModuleByIndex := CallbackCreate(GetMethod(implObj, "GetModuleByIndex"), flags, 3)
        this.vtbl.GetModuleByModuleName := CallbackCreate(GetMethod(implObj, "GetModuleByModuleName"), flags, 5)
        this.vtbl.GetModuleByOffset := CallbackCreate(GetMethod(implObj, "GetModuleByOffset"), flags, 5)
        this.vtbl.GetModuleNames := CallbackCreate(GetMethod(implObj, "GetModuleNames"), flags, 12)
        this.vtbl.GetModuleParameters := CallbackCreate(GetMethod(implObj, "GetModuleParameters"), flags, 5)
        this.vtbl.GetSymbolModule := CallbackCreate(GetMethod(implObj, "GetSymbolModule"), flags, 3)
        this.vtbl.GetTypeName := CallbackCreate(GetMethod(implObj, "GetTypeName"), flags, 6)
        this.vtbl.GetTypeId := CallbackCreate(GetMethod(implObj, "GetTypeId"), flags, 4)
        this.vtbl.GetTypeSize := CallbackCreate(GetMethod(implObj, "GetTypeSize"), flags, 4)
        this.vtbl.GetFieldOffset := CallbackCreate(GetMethod(implObj, "GetFieldOffset"), flags, 5)
        this.vtbl.GetSymbolTypeId := CallbackCreate(GetMethod(implObj, "GetSymbolTypeId"), flags, 4)
        this.vtbl.GetOffsetTypeId := CallbackCreate(GetMethod(implObj, "GetOffsetTypeId"), flags, 4)
        this.vtbl.ReadTypedDataVirtual := CallbackCreate(GetMethod(implObj, "ReadTypedDataVirtual"), flags, 7)
        this.vtbl.WriteTypedDataVirtual := CallbackCreate(GetMethod(implObj, "WriteTypedDataVirtual"), flags, 7)
        this.vtbl.OutputTypedDataVirtual := CallbackCreate(GetMethod(implObj, "OutputTypedDataVirtual"), flags, 6)
        this.vtbl.ReadTypedDataPhysical := CallbackCreate(GetMethod(implObj, "ReadTypedDataPhysical"), flags, 7)
        this.vtbl.WriteTypedDataPhysical := CallbackCreate(GetMethod(implObj, "WriteTypedDataPhysical"), flags, 7)
        this.vtbl.OutputTypedDataPhysical := CallbackCreate(GetMethod(implObj, "OutputTypedDataPhysical"), flags, 6)
        this.vtbl.GetScope := CallbackCreate(GetMethod(implObj, "GetScope"), flags, 5)
        this.vtbl.SetScope := CallbackCreate(GetMethod(implObj, "SetScope"), flags, 5)
        this.vtbl.ResetScope := CallbackCreate(GetMethod(implObj, "ResetScope"), flags, 1)
        this.vtbl.GetScopeSymbolGroup := CallbackCreate(GetMethod(implObj, "GetScopeSymbolGroup"), flags, 4)
        this.vtbl.CreateSymbolGroup := CallbackCreate(GetMethod(implObj, "CreateSymbolGroup"), flags, 2)
        this.vtbl.StartSymbolMatch := CallbackCreate(GetMethod(implObj, "StartSymbolMatch"), flags, 3)
        this.vtbl.GetNextSymbolMatch := CallbackCreate(GetMethod(implObj, "GetNextSymbolMatch"), flags, 6)
        this.vtbl.EndSymbolMatch := CallbackCreate(GetMethod(implObj, "EndSymbolMatch"), flags, 2)
        this.vtbl.Reload := CallbackCreate(GetMethod(implObj, "Reload"), flags, 2)
        this.vtbl.GetSymbolPath := CallbackCreate(GetMethod(implObj, "GetSymbolPath"), flags, 4)
        this.vtbl.SetSymbolPath := CallbackCreate(GetMethod(implObj, "SetSymbolPath"), flags, 2)
        this.vtbl.AppendSymbolPath := CallbackCreate(GetMethod(implObj, "AppendSymbolPath"), flags, 2)
        this.vtbl.GetImagePath := CallbackCreate(GetMethod(implObj, "GetImagePath"), flags, 4)
        this.vtbl.SetImagePath := CallbackCreate(GetMethod(implObj, "SetImagePath"), flags, 2)
        this.vtbl.AppendImagePath := CallbackCreate(GetMethod(implObj, "AppendImagePath"), flags, 2)
        this.vtbl.GetSourcePath := CallbackCreate(GetMethod(implObj, "GetSourcePath"), flags, 4)
        this.vtbl.GetSourcePathElement := CallbackCreate(GetMethod(implObj, "GetSourcePathElement"), flags, 5)
        this.vtbl.SetSourcePath := CallbackCreate(GetMethod(implObj, "SetSourcePath"), flags, 2)
        this.vtbl.AppendSourcePath := CallbackCreate(GetMethod(implObj, "AppendSourcePath"), flags, 2)
        this.vtbl.FindSourceFile := CallbackCreate(GetMethod(implObj, "FindSourceFile"), flags, 8)
        this.vtbl.GetSourceFileLineOffsets := CallbackCreate(GetMethod(implObj, "GetSourceFileLineOffsets"), flags, 5)
        this.vtbl.GetModuleVersionInformation := CallbackCreate(GetMethod(implObj, "GetModuleVersionInformation"), flags, 7)
        this.vtbl.GetModuleNameString := CallbackCreate(GetMethod(implObj, "GetModuleNameString"), flags, 7)
        this.vtbl.GetConstantName := CallbackCreate(GetMethod(implObj, "GetConstantName"), flags, 7)
        this.vtbl.GetFieldName := CallbackCreate(GetMethod(implObj, "GetFieldName"), flags, 7)
        this.vtbl.GetTypeOptions := CallbackCreate(GetMethod(implObj, "GetTypeOptions"), flags, 2)
        this.vtbl.AddTypeOptions := CallbackCreate(GetMethod(implObj, "AddTypeOptions"), flags, 2)
        this.vtbl.RemoveTypeOptions := CallbackCreate(GetMethod(implObj, "RemoveTypeOptions"), flags, 2)
        this.vtbl.SetTypeOptions := CallbackCreate(GetMethod(implObj, "SetTypeOptions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSymbolOptions)
        CallbackFree(this.vtbl.AddSymbolOptions)
        CallbackFree(this.vtbl.RemoveSymbolOptions)
        CallbackFree(this.vtbl.SetSymbolOptions)
        CallbackFree(this.vtbl.GetNameByOffset)
        CallbackFree(this.vtbl.GetOffsetByName)
        CallbackFree(this.vtbl.GetNearNameByOffset)
        CallbackFree(this.vtbl.GetLineByOffset)
        CallbackFree(this.vtbl.GetOffsetByLine)
        CallbackFree(this.vtbl.GetNumberModules)
        CallbackFree(this.vtbl.GetModuleByIndex)
        CallbackFree(this.vtbl.GetModuleByModuleName)
        CallbackFree(this.vtbl.GetModuleByOffset)
        CallbackFree(this.vtbl.GetModuleNames)
        CallbackFree(this.vtbl.GetModuleParameters)
        CallbackFree(this.vtbl.GetSymbolModule)
        CallbackFree(this.vtbl.GetTypeName)
        CallbackFree(this.vtbl.GetTypeId)
        CallbackFree(this.vtbl.GetTypeSize)
        CallbackFree(this.vtbl.GetFieldOffset)
        CallbackFree(this.vtbl.GetSymbolTypeId)
        CallbackFree(this.vtbl.GetOffsetTypeId)
        CallbackFree(this.vtbl.ReadTypedDataVirtual)
        CallbackFree(this.vtbl.WriteTypedDataVirtual)
        CallbackFree(this.vtbl.OutputTypedDataVirtual)
        CallbackFree(this.vtbl.ReadTypedDataPhysical)
        CallbackFree(this.vtbl.WriteTypedDataPhysical)
        CallbackFree(this.vtbl.OutputTypedDataPhysical)
        CallbackFree(this.vtbl.GetScope)
        CallbackFree(this.vtbl.SetScope)
        CallbackFree(this.vtbl.ResetScope)
        CallbackFree(this.vtbl.GetScopeSymbolGroup)
        CallbackFree(this.vtbl.CreateSymbolGroup)
        CallbackFree(this.vtbl.StartSymbolMatch)
        CallbackFree(this.vtbl.GetNextSymbolMatch)
        CallbackFree(this.vtbl.EndSymbolMatch)
        CallbackFree(this.vtbl.Reload)
        CallbackFree(this.vtbl.GetSymbolPath)
        CallbackFree(this.vtbl.SetSymbolPath)
        CallbackFree(this.vtbl.AppendSymbolPath)
        CallbackFree(this.vtbl.GetImagePath)
        CallbackFree(this.vtbl.SetImagePath)
        CallbackFree(this.vtbl.AppendImagePath)
        CallbackFree(this.vtbl.GetSourcePath)
        CallbackFree(this.vtbl.GetSourcePathElement)
        CallbackFree(this.vtbl.SetSourcePath)
        CallbackFree(this.vtbl.AppendSourcePath)
        CallbackFree(this.vtbl.FindSourceFile)
        CallbackFree(this.vtbl.GetSourceFileLineOffsets)
        CallbackFree(this.vtbl.GetModuleVersionInformation)
        CallbackFree(this.vtbl.GetModuleNameString)
        CallbackFree(this.vtbl.GetConstantName)
        CallbackFree(this.vtbl.GetFieldName)
        CallbackFree(this.vtbl.GetTypeOptions)
        CallbackFree(this.vtbl.AddTypeOptions)
        CallbackFree(this.vtbl.RemoveTypeOptions)
        CallbackFree(this.vtbl.SetTypeOptions)
    }
}
