#include "fspusb_drivefilesystem.hpp"

Result DriveFileSystem::CreateFileImpl(const FsPath &path, uint64_t size, int flags) { return 0; }

Result DriveFileSystem::DeleteFileImpl(const FsPath &path) { return 0; }

Result DriveFileSystem::CreateDirectoryImpl(const FsPath &path) {
    FILE *f = fopen("sdmc:/fspusb.log", "a");
    std::string sl = "Path: " + std::string(path.str);
    fwrite(sl.c_str(), 1, sl.length(), f);
    fclose(f);
    return 0;
}

Result DriveFileSystem::DeleteDirectoryImpl(const FsPath &path) { return 0; }

Result DriveFileSystem::DeleteDirectoryRecursivelyImpl(const FsPath &path) { return 0; }

Result DriveFileSystem::RenameFileImpl(const FsPath &old_path, const FsPath &new_path) { return 0; }

Result DriveFileSystem::RenameDirectoryImpl(const FsPath &old_path, const FsPath &new_path) { return 0; }

Result DriveFileSystem::GetEntryTypeImpl(DirectoryEntryType *out, const FsPath &path) { return 0; }

Result DriveFileSystem::OpenFileImpl(std::unique_ptr<IFile> &out_file, const FsPath &path, OpenMode mode) { return 0; }

Result DriveFileSystem::OpenDirectoryImpl(std::unique_ptr<IDirectory> &out_dir, const FsPath &path, DirectoryOpenMode mode) { return 0; }

Result DriveFileSystem::CommitImpl() { return 0; }

Result DriveFileSystem::GetFreeSpaceSizeImpl(uint64_t *out, const FsPath &path) { return 0; }

Result DriveFileSystem::GetTotalSpaceSizeImpl(uint64_t *out, const FsPath &path) { return 0; }

Result DriveFileSystem::CleanDirectoryRecursivelyImpl(const FsPath &path) { return 0; }

Result DriveFileSystem::GetFileTimeStampRawImpl(FsTimeStampRaw *out, const FsPath &path) { return 0; }

Result DriveFileSystem::QueryEntryImpl(char *out, uint64_t out_size, const char *in, uint64_t in_size, int query, const FsPath &path) { return 0; }