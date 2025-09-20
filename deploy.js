async function main() {
  const FileIntegrity = await ethers.getContractFactory("FileIntegrity");
  const fileIntegrity = await FileIntegrity.deploy();
  await fileIntegrity.deployed();
  console.log("Contract deployed at:", fileIntegrity.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
